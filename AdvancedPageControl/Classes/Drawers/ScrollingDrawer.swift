//
//  InfiniteDrawer.swift
//  AdvancedPageControl
//
//  Created by Mohaned Benmesken on 3/11/20.
//

import Foundation
import UIKit

public class ScrollingDrawer: AdvancedPageControlDrawerParentWithIndicator, AdvancedPageControlDraw {
    public func draw(_ rect: CGRect) {
        drawIndicators(rect)
        drawCurrentItem(rect)
    }

    func drawIndicators(_ rect: CGRect) {
        let centeredYPosition = getCenteredYPosition(rect, dotSize: size)
        for i in 0 ..< numberOfPages {
            let y = rect.origin.y + centeredYPosition
            let centeredX = getCenteredXPosition(rect, itemPos: CGFloat(i), dotSize: width, space: space, numberOfPages: numberOfPages)
            let x = centeredX + ((width + space) * floor(CGFloat(numberOfPages) / 2)) - (currentItem * (width + space))
            drawItem(CGRect(x: x, y: y, width: CGFloat(width), height: CGFloat(size)),
                     raduis: radius, color: dotsColor, index: i)
        }
    }

    fileprivate func drawCurrentItem(_ rect: CGRect) {
        let centeredYPosition = getCenteredYPosition(rect, dotSize: size + 8)
        let y = rect.origin.y + centeredYPosition
        let x = getCenteredXPosition(rect, itemPos: floor(CGFloat(numberOfPages) / 2), dotSize: width + 8, space: space, numberOfPages: numberOfPages)
        drawItem(CGRect(x: x, y: y, width: width + 8, height: size + 8),
                 raduis: radius, color: .clear, borderWidth: indicatorBorderWidth, borderColor: indicatorBorderColor, index: numberOfPages)
    }
}
