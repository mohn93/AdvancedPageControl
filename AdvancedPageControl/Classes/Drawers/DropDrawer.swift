//
//  DropDrawer.swift
//  Maps
//
//  Created by Mohaned Benmesken on 12/30/19.
//  Copyright © 2019 Mohaned Benmesken. All rights reserved.
//

import Foundation
import UIKit
public class DropDrawer: AdvancedPageControlDrawerParentWithIndicator, AdvancedPageControlDraw {
    var dropRatio: CGFloat = -10

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
        let scaleFactor = getScaleFactor(currentItem: currentItem, ratio: dropRatio)
        let centeredYPosition = getCenteredYPosition(rect, dotSize: size)
        let y = rect.origin.y + centeredYPosition + (scaleFactor * 2)
        let x = getCenteredXPosition(rect, itemPos: currentItem, dotSize: width, space: space, numberOfPages: numberOfPages) - (scaleFactor / 2)
        drawItem(CGRect(x: x, y: y, width: width + scaleFactor, height: size + scaleFactor),
                 raduis: radius, color: indicatorColor, borderWidth: indicatorBorderWidth, borderColor: indicatorBorderColor, index: numberOfPages)
    }
}
