//
//  ExtendedDot.swift
//  Maps
//
//  Created by Mohaned Benmesken on 12/31/19.
//  Copyright © 2019 Mohaned Benmesken. All rights reserved.
//

import Foundation
import UIKit
public class ExtendedDotDrawer:AdvancedPageControlDrawerParent, AdvancedPageControlDraw {
    
    public init(numberOfPages: Int? = 5,
                space: CGFloat? = 16,
                raduis: CGFloat? = 32,
                height:CGFloat? = 16,
                width:CGFloat? = 16,
                currentItem: CGFloat? = 0,
                dotsColor: UIColor? = .white,
                isBordered:Bool = false,
                borderColor:UIColor = .black,
                borderWidth:CGFloat = 1) {

        
        super.init(numberOfPages: numberOfPages!,
                   height: height!,
                   width: width!,
                   space: space!,
                   raduis: raduis!,
                   currentItem: currentItem!,
                   indicatorColor: dotsColor,
                   dotsColor: dotsColor,
                   isBordered: isBordered,
                   borderColor: borderColor,
                   borderWidth:  borderWidth)
    }
    
    public func draw(_ rect: CGRect) {
        drawIndicators(rect)
        drawCurrentItem(rect)
    }
    
    func drawIndicators(_ rect: CGRect) {
        let step: (CGFloat) = (space + width)
        
        for i in 0...numberOfPages{
            if i != Int(currentItem + 1) && i != Int(currentItem ) {
                
                if i == Int(currentItem + 2){
                    let centeredYPosition = getCenteredYPosition(rect, dotSize: height)
                    let y = rect.origin.y + centeredYPosition
                    let currPosProgress = currentItem - floor(currentItem)
                    let curPos =  (floor(currentItem + 2)) - currPosProgress
                    let x = getCenteredXPosition(rect, itemPos: curPos, dotSize: width,space: space, numberOfPages: numberOfPages+1)
                    let halfMovementRatio =   1 - currPosProgress
                    // reverse the scale value
                    let scale = step - ( halfMovementRatio  * step )
                    drawItem(CGRect(x: rect.origin.x  + x, y:  y , width:  width  + scale, height: height )
                        , raduis:radius,color: dotsColor)
                }else{
                    let centeredYPosition = getCenteredYPosition(rect, dotSize: height)
                    let y =  rect.origin.y + centeredYPosition
                    let x = getCenteredXPosition(rect,itemPos: CGFloat(i), dotSize: width,space: space, numberOfPages: numberOfPages+1)
                    drawItem(CGRect(x: rect.origin.x + x, y:  y, width: width, height: height)
                        , raduis:radius,color: dotsColor)
                    
                }
            }
        }
    }
    
    fileprivate func drawCurrentItem(_ rect: CGRect) {
        if currentItem >= 0{
            let step: (CGFloat) = (space + width)
            let centeredYPosition = getCenteredYPosition(rect, dotSize: height)
            let y = rect.origin.y + centeredYPosition
            let currPosProgress = currentItem - floor(currentItem)
            let steadyPosition =  (floor(currentItem))
            let x = getCenteredXPosition(rect, itemPos: steadyPosition, dotSize: width,space: space, numberOfPages: (numberOfPages)+1)
            let halfMovementRatio =  1 - currPosProgress
            drawItem(CGRect(x: rect.origin.x  + x, y:  y , width:  width  + ( halfMovementRatio  * step ), height: height )
                , raduis:radius,color: dotsColor)
        }
        
    }
}
