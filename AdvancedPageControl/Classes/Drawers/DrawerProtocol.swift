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
    var numberOfPages:Int { get set }
    func draw(_ rect: CGRect)
}

public class AdvancedPageControlDrawerParent {
   public var numberOfPages:Int
    var height: CGFloat
    var width: CGFloat
    var space: CGFloat
    var radius: CGFloat
   public var currentItem:CGFloat
    var indicatorColor:UIColor
    var dotsColor:UIColor
    var isBordered:Bool
    var borderColor:UIColor
    var borderWidth :CGFloat
    
    
   public init(numberOfPages:Int? = 5,
         height: CGFloat? = 16,
         width: CGFloat? = 16,
         space: CGFloat? = 16,
         raduis: CGFloat? = 16,
         currentItem: CGFloat? = 0,
         indicatorColor: UIColor? = .white,
         dotsColor: UIColor? = UIColor.lightGray,
         isBordered:Bool = false,
         borderColor:UIColor = .white,
         borderWidth:CGFloat = 1) {
        self.numberOfPages = numberOfPages!
        self.space = space!
        self.radius = raduis!
        self.currentItem = currentItem!
        self.indicatorColor = indicatorColor!
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
    
    func drawItem(_ rect: CGRect, raduis:CGFloat, color:UIColor){
        let path = UIBezierPath(roundedRect:rect, cornerRadius: raduis)
        
        if isBordered {
            path.lineWidth = borderWidth
            borderColor.setStroke()
            path.stroke()
        }
        
        color.setFill()

        path.fill()
    }
}
