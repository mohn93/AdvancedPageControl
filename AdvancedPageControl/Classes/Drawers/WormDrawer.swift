//
//  WormDrawer.swift
//  Maps
//
//  Created by Mohaned Benmesken on 12/30/19.
//  Copyright © 2019 Mohaned Benmesken. All rights reserved.
//

import Foundation
import UIKit
public class WormDrawer: AdvancedPageControlDrawerParentWithIndicator, AdvancedPageControlDraw {
    public func draw(_ rect: CGRect) {
        drawIndicators(rect)
        drawCurrentItem(rect)
    }

    func drawIndicators(_ rect: CGRect) {
        for i in 0 ..< numberOfPages {
            let centeredYPosition = getCenteredYPosition(rect, dotSize: size)
            let y = rect.origin.y + centeredYPosition
            let x = getCenteredXPosition(rect, itemPos: CGFloat(i), dotSize: width, space: space, numberOfPages: numberOfPages)
            drawItem(CGRect(x: x, y: y, width: CGFloat(width), height: CGFloat(size)),
                     raduis: radius, color: dotsColor, borderWidth: borderWidth, borderColor: borderColor, index: i)
        }
    }

    fileprivate func drawCurrentItem(_ rect: CGRect) {
        let centeredYPosition = getCenteredYPosition(rect, dotSize: size)
        let y = rect.origin.y + centeredYPosition
        let currPosTranslate = currentItem - floor(currentItem)
        let curPos = currPosTranslate > 0.5 ? ((currPosTranslate - 0.5) * 2) + floor(currentItem) : floor(currentItem)
        let x = getCenteredXPosition(rect, itemPos: curPos, dotSize: width, space: space, numberOfPages: numberOfPages)
        let halfMovementRatio = (currPosTranslate < 0.5 ? currPosTranslate : 0.5 - (currPosTranslate - 0.5))
        drawItem(CGRect(x: x, y: y, width: width + (halfMovementRatio * 2 * (space + width)), height: size),
                 raduis: radius, color: indicatorColor, borderWidth: indicatorBorderWidth, borderColor: indicatorBorderColor, index: Int(currentItem))
    }
}
