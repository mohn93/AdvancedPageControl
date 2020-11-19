//
//  DrawerProtocol.swift
//  Maps
//
//  Created by Mohaned Benmesken on 12/30/19.
//  Copyright © 2019 Mohaned Benmesken. All rights reserved.
//

import Foundation
import UIKit
public protocol AdvancedPageControlDraw {
    var currentItem:CGFloat { get set }
    var selectedPage:Int { get set }
    var height:CGFloat { get set }
    var numberOfPages:Int { get set }
    var layer:CALayer? {get set}
    func draw(_ rect: CGRect)
}

public class AdvancedPageControlDrawerParentWithIndicator:AdvancedPageControlDrawerParent {
    var indicatorBorderColor:UIColor
    var indicatorBorderWidth:CGFloat
    var indicatorColor:UIColor
    public  init(numberOfPages: Int? = 5,
                 height: CGFloat? = 16,
                 width: CGFloat? = 16,
                 space: CGFloat? = 16,
                 raduis: CGFloat? = 8,
                 currentItem: CGFloat? = 0,
                 indicatorColor: UIColor? = .white,
                 dotsColor: UIColor? = UIColor.lightGray,
                 isBordered: Bool = false,
                 borderColor: UIColor = .white,
                 borderWidth: CGFloat = 1,
                 indicatorBorderColor: UIColor = .white,
                 indicatorBorderWidth: CGFloat = 2) {
        self.indicatorBorderColor = indicatorBorderColor
        self.indicatorBorderWidth = indicatorBorderWidth
        self.indicatorColor = indicatorColor!
        super.init(numberOfPages: numberOfPages, height: height, width: width, space: space, raduis: raduis, currentItem: currentItem, dotsColor: dotsColor, isBordered: isBordered, borderColor: borderColor, borderWidth: borderWidth)
        
    }
    
}
public class AdvancedPageControlDrawerParent {
    public var numberOfPages:Int
    public var height: CGFloat
    var width: CGFloat
    var space: CGFloat
    var radius: CGFloat
    public var currentItem:CGFloat
    public var selectedPage:Int = 0
    var dotsColor:UIColor
    var isBordered:Bool
    var borderColor:UIColor
    var borderWidth :CGFloat
    public var layer:CALayer? = nil
    public var items = [Int]()
    
    public init(numberOfPages:Int? = 5,
                height: CGFloat? = 16,
                width: CGFloat? = 16,
                space: CGFloat? = 16,
                raduis: CGFloat? = 16,
                currentItem: CGFloat? = 0,
                dotsColor: UIColor? = UIColor.lightGray,
                isBordered:Bool = false,
                borderColor:UIColor = .white,
                borderWidth:CGFloat = 1
    ) {
        self.numberOfPages = numberOfPages!
        self.space = space!
        self.radius = raduis!
        self.currentItem = currentItem!
        self.dotsColor = dotsColor!
        self.width = width!
        self.height = height!
        self.isBordered = isBordered
        self.borderColor = borderColor
        self.borderWidth = borderWidth
    }
    
    func getScaleFactor(currentItem: CGFloat,ratio:CGFloat) -> CGFloat{
        let scale = currentItem - floor(currentItem)
        let scaleFactor = ( scale > 0.5 ? 0.5 - (scale - 0.5) : scale) * ratio
        return scaleFactor
    }
    
    func getCenteredXPosition(_ rect: CGRect,itemPos:CGFloat,dotSize:CGFloat,space:CGFloat,numberOfPages:Int) -> CGFloat {
        let individualDotPos = (itemPos  * (dotSize + space ))
        let halfViewWidth = ((rect.width ) / 2)
        let halfAlldotsWidthWithSpaces = ((CGFloat(numberOfPages) * (dotSize + (space - 1) )) / 2.0)
        return individualDotPos - halfAlldotsWidthWithSpaces + halfViewWidth
    }
    
    func getCenteredYPosition(_ rect :CGRect, dotSize:CGFloat) -> CGFloat{
        let halfViewHeight = (rect.size.height / 2)
        let halfDotSize = (dotSize / 2 )
        let centeredYPosition = halfViewHeight - halfDotSize
        return centeredYPosition
    }
    
    func drawItem(_ rect: CGRect, raduis:CGFloat, color:UIColor, borderWidth:CGFloat = 0, borderColor:UIColor = .clear,index:Int = 0){
        
        if let layer = layer { // WIP
//            let path = UIBezierPath(roundedRect:rect, cornerRadius: raduis)
//            path.lineWidth = borderWidth
//            borderColor.setStroke()
//            path.stroke()
//            color.setFill()
//            path.fill()
            
            if items.contains(index){
                let currentLayer = layer.sublayers![index]
                                currentLayer.frame = rect
                                let maxLine = max(rect.width / 2 ,rect.height/2)
                                let max = (Int(maxLine > 0 ? maxLine : 1))
                                let newRadius = min(CGFloat(Int(raduis)),CGFloat(max))
//                let anim = CABasicAnimation(keyPath: "path")
//                anim.duration = 0.3
//                anim.fromValue = (currentLayer as! CAShapeLayer).path
//                anim.toValue = path.cgPath
//                currentLayer.add(anim, forKey: "path")
//                (currentLayer as! CAShapeLayer).path = path.cgPath
                                currentLayer.cornerRadius = newRadius
                                currentLayer.borderWidth = borderWidth
                                currentLayer.backgroundColor = color.cgColor
                                currentLayer.borderColor = borderColor.cgColor
                
            } else {
                items.append(index)
                let newLayer = CAShapeLayer()
                                newLayer.backgroundColor = color.cgColor
                                newLayer.borderWidth = borderWidth
                                newLayer.cornerRadius = raduis
                                newLayer.borderColor = borderColor.cgColor
//                newLayer.path = path.cgPath
                                newLayer.frame = rect
                layer.addSublayer(newLayer)
            }
            
        } else {
            
            let path = UIBezierPath(roundedRect:rect, cornerRadius: raduis)
            path.lineWidth = borderWidth
            borderColor.setStroke()
            path.stroke()
            color.setFill()
            path.fill()
            
        }
    }
}
