//
//  ExtendedDot.swift
//  Maps
//
//  Created by Mohaned Benmesken on 12/31/19.
//  Copyright © 2019 Mohaned Benmesken. All rights reserved.
//

import Foundation
import UIKit
public class ExtendedDotDrawer: AdvancedPageControlDrawerParentWithIndicator, AdvancedPageControlDraw {
    public func draw(_ rect: CGRect) {
        drawIndicators(rect)
        drawCurrentItem(rect)
    }

    func drawIndicators(_ rect: CGRect) {
        let step: CGFloat = (space + width)

        for i in 0 ... numberOfPages {
            if i != Int(currentItem + 1), i != Int(currentItem) {
                var newX: CGFloat = 0
                var newY: CGFloat = 0
                var newHeight: CGFloat = 0
                var newWidth: CGFloat = 0

                let progress = currentItem - floor(currentItem)

                var dotColor = dotsColor

                if i == Int(currentItem + 2) {
                    dotColor = (dotsColor * Double(1 - progress)) + (indicatorColor * Double(progress))

                    let centeredYPosition = getCenteredYPosition(rect, dotSize: size)
                    let y = rect.origin.y + centeredYPosition
                    let currPosProgress = currentItem - floor(currentItem)
                    let curPos = floor(currentItem + 2) - currPosProgress
                    let x = getCenteredXPosition(rect, itemPos: curPos, dotSize: width, space: space, numberOfPages: numberOfPages + 1)
                    let halfMovementRatio = 1 - currPosProgress
                    // reverse the scale value
                    let scale = step - (halfMovementRatio * step)

                    newHeight = size
                    newWidth = width + scale
                    newX = rect.origin.x + x
                    newY = y

                } else {
                    let centeredYPosition = getCenteredYPosition(rect, dotSize: size)
                    let y = rect.origin.y + centeredYPosition
                    let x = getCenteredXPosition(rect, itemPos: CGFloat(i), dotSize: width, space: space, numberOfPages: numberOfPages + 1)

                    newHeight = size
                    newWidth = width
                    newX = rect.origin.x + x
                    newY = y
                }

                drawItem(CGRect(x: newX, y: newY, width: newWidth, height: newHeight), raduis: radius,
                         color: dotColor,
                         borderWidth: borderWidth, borderColor: borderColor)
            }
        }
    }

    fileprivate func drawCurrentItem(_ rect: CGRect) {
        let progress = currentItem - floor(currentItem)
        let color = (dotsColor * Double(progress)) + (indicatorColor * Double(1 - progress))
        if currentItem >= 0 {
            let step: CGFloat = (space + width)
            let centeredYPosition = getCenteredYPosition(rect, dotSize: size)
            let y = rect.origin.y + centeredYPosition
            let currPosProgress = currentItem - floor(currentItem)
            let steadyPosition = floor(currentItem)
            
            let x = getCenteredXPosition(rect,
                                         itemPos: steadyPosition,
                                         dotSize: width,
                                         space: space,
                                         numberOfPages: numberOfPages + 1)
            
            let halfMovementRatio = 1 - currPosProgress
            let desiredWidth = width + (halfMovementRatio * step)
            let desiredX = rect.origin.x + x
            let rect = CGRect(x: desiredX,
                              y: y,
                              width: desiredWidth,
                              height: size)
            
            drawItem(rect,
                     raduis: radius,
                     color: color,
                     borderWidth: borderWidth,
                     borderColor: borderColor)
        }
    }
}
