//
//  SwapDrawer.swift
//  Maps
//
//  Created by Mohaned Benmesken on 12/31/19.
//  Copyright © 2019 Mohaned Benmesken. All rights reserved.
//

import Foundation
import UIKit
public class SwapDrawer: AdvancedPageControlDrawerParentWithIndicator, AdvancedPageControlDraw {
    public func draw(_ rect: CGRect) {
        drawIndicators(rect)
        drawCurrentItem(rect)
    }

    func drawIndicators(_ rect: CGRect) {
        for i in 0 ..< numberOfPages {
            if Int(floor(currentItem)) != i {
                let translate = (width + space) * (currentItem - floor(currentItem))
                let centeredYPosition = getCenteredYPosition(rect, dotSize: size)
                let y = rect.origin.y + centeredYPosition
                if i == Int(floor(currentItem) + 1), currentItem >= 0.0 {
                    let x = getCenteredXPosition(rect, itemPos: CGFloat(i), dotSize: width, space: space, numberOfPages: numberOfPages) - translate
                    drawItem(CGRect(x: x, y: y, width: CGFloat(width), height: CGFloat(size)),
                             raduis: radius, color: dotsColor, borderWidth: borderWidth, borderColor: borderColor)
                } else if ceil(currentItem) != CGFloat(i) {
                    let x = getCenteredXPosition(rect, itemPos: CGFloat(i), dotSize: width, space: space, numberOfPages: numberOfPages)
                    drawItem(CGRect(x: x, y: y, width: CGFloat(width), height: CGFloat(size)),
                             raduis: radius, color: dotsColor, borderWidth: borderWidth, borderColor: borderColor)
                }
            }
        }
    }

    fileprivate func drawCurrentItem(_ rect: CGRect) {
        let centeredYPosition = getCenteredYPosition(rect, dotSize: size)
        let y = rect.origin.y + centeredYPosition
        let x = getCenteredXPosition(rect, itemPos: currentItem, dotSize: width, space: space, numberOfPages: numberOfPages)
        drawItem(CGRect(x: x, y: y, width: width, height: size),
                 raduis: radius, color: indicatorColor, borderWidth: indicatorBorderWidth, borderColor: indicatorBorderColor)
    }
}
