//
//  CustomIndicatorView.swift
//  Maps
//
//  Created by Mohaned Benmesken on 12/30/19.
//  Copyright © 2019 Mohaned Benmesken. All rights reserved.
//

import Foundation
import UIKit

public class AdvancedPageControlView: UIView{
    public var numberOfPages:Int {get {return drawer.numberOfPages} set(val){
        setNeedsDisplay()
        drawer.numberOfPages = val
    }}
    
    public var drawer:AdvancedPageControlDraw =  InfiniteScrollingDrawer()
    
    public func setCurrentItem(offset:CGFloat,width:CGFloat){
        drawer.currentItem = CGFloat(offset ) / CGFloat(width)
        setNeedsDisplay()
    }
    
    public func setPage( _ index:Int ) {
        if drawer.currentItem != CGFloat(index){
            drawer.layer = layer
            drawer.currentItem = CGFloat(index)
            setNeedsDisplay()
        }
    }
    
    override public var intrinsicContentSize: CGSize {
        return CGSize(width: self.drawer.height, height: self.drawer.height + 16)
    }
    
    override public func draw(_ rect: CGRect) {
        drawer.draw(rect)
    }
}


/// A backing layer for ProgressView which supports certain animatable values.
fileprivate class ProgressLayer: CAShapeLayer {
    @NSManaged var currentItem: CGFloat
    
    // Whenever a new presentation layer is created, this function is called and makes a COPY of the object.
    override init(layer: Any) {
        super.init(layer: layer)
        if let layer = layer as? ProgressLayer {
            currentItem = layer.currentItem
        }
    }
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override class func needsDisplay(forKey key: String) -> Bool {
        if isAnimationKeySupported(key) {
            return true
        }
        return super.needsDisplay(forKey: key)
    }
    
    override func action(forKey event: String) -> CAAction? {
        if ProgressLayer.isAnimationKeySupported(event) {
            // Copy animation context and mutate as needed
            guard let animation = currentAnimationContext(in: self)?.copy() as? CABasicAnimation else {
                setNeedsDisplay()
                return nil
            }
            
            animation.keyPath = event
            if let presentation = presentation() {
                animation.fromValue = presentation.value(forKeyPath: event)
            }
            animation.toValue = nil
            print(event)
            return animation
        }
        
        
        return super.action(forKey: event)
    }
    
    private class func isAnimationKeySupported(_ key: String) -> Bool {
        return key == #keyPath(currentItem)
    }
    
    private func currentAnimationContext(in layer: CALayer) -> CABasicAnimation? {
        /// The UIView animation implementation is private, so to check if the view is animating and
        /// get its property keys we can use the key "backgroundColor" since its been a property of
        /// UIView which has been forever and returns a CABasicAnimation.
        return action(forKey: #keyPath(backgroundColor)) as? CABasicAnimation
    }
}
