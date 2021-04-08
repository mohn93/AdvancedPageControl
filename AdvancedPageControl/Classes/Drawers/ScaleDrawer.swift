//
//  ScaleDrawer.swift
//  Maps
//
//  Created by Mohaned Benmesken on 12/30/19.
//  Copyright © 2019 Mohaned Benmesken. All rights reserved.
//

import Foundation
import UIKit
public class ScaleDrawer: AdvancedPageControlDrawerParentWithIndicator, AdvancedPageControlDraw {
    var scaleFactor: CGFloat = 8

    public func draw(_ rect: CGRect) {
        drawIndicators(rect)
    }

    func drawIndicators(_ rect: CGRect) {
        for i in 0 ..< numberOfPages {
            let topTranslate = scaleFactor
            let progress = currentItem - floor(currentItem)
            let translate = scaleFactor * (currentItem - floor(currentItem))
            let widthRatio = width / size
            let heightRatio = size / width
            if Int(floor(currentItem)) != i {
                if i == Int(floor(currentItem) + 1) {
                    let centeredYPosition = getCenteredYPosition(rect, dotSize: size)
                    let y = rect.origin.y + centeredYPosition - (translate * heightRatio) / 2
                    let x = getCenteredXPosition(rect, itemPos: CGFloat(i), dotSize: width, space: space, numberOfPages: numberOfPages) - (translate * widthRatio) / 2
                    drawItem(CGRect(x: x, y: y, width: width + (translate * widthRatio), height: size + (translate * heightRatio)),
                             raduis: radius + (translate / 2), color: (indicatorColor * Double(progress)) + (dotsColor * Double(1 - progress)), borderWidth: borderWidth, borderColor: borderColor, index: i)
                } else {
                    let centeredYPosition = getCenteredYPosition(rect, dotSize: size)
                    let y = rect.origin.y + centeredYPosition
                    let x = getCenteredXPosition(rect, itemPos: CGFloat(i), dotSize: width, space: space, numberOfPages: numberOfPages)
                    drawItem(CGRect(x: x, y: y, width: width, height: size),
                             raduis: radius, color: dotsColor, borderWidth: borderWidth, borderColor: borderColor, index: i)
                }
            } else {
                let opisiteTranslate = (topTranslate - translate)
                let centeredYPosition = getCenteredYPosition(rect, dotSize: size)
                let y = rect.origin.y + centeredYPosition - (opisiteTranslate * heightRatio) / 2
                let x = getCenteredXPosition(rect, itemPos: CGFloat(i), dotSize: width, space: space, numberOfPages: numberOfPages) - (opisiteTranslate * widthRatio) / 2
                drawItem(CGRect(x: x, y: y, width: width + (opisiteTranslate * widthRatio), height: size + (opisiteTranslate * heightRatio)),
                         raduis: radius + (opisiteTranslate / 2), color: (dotsColor * Double(progress)) + (indicatorColor * Double(1 - progress)), borderWidth: borderWidth, borderColor: borderColor, index: i)
            }
        }
    }
}
