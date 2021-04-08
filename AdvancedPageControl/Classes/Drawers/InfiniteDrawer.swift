//
//  InfiniteDrawer.swift
//  AdvancedPageControl
//
//  Created by Mohaned Benmesken on 3/11/20.
//

import Foundation

import UIKit
public class InfiniteDrawer: AdvancedPageControlDrawerParentWithIndicator, AdvancedPageControlDraw {
    let endsDotScale: CGFloat = 0.5
    var centerScale: CGFloat = 0.3
    var visibleDots: Int = 5

    public func draw(_ rect: CGRect) {
        drawIndicators(rect)
    }

    func drawIndicators(_ rect: CGRect) {
        let centeredYPosition = getCenteredYPosition(rect, dotSize: size)
        for i in 0 ..< numberOfPages {
            let topTranslate = width
            let progress = currentItem - floor(currentItem)
            let translate = (endsDotScale * width) * (currentItem - floor(currentItem))
            let ed = Int(floor(currentItem) + ceil(CGFloat(visibleDots / 2)))
            let sd = Int(floor(currentItem) - ceil(CGFloat(visibleDots / 2)))
            let center = Int(floor(currentItem))
            let widthRatio = width / size
            let heightRatio = size / width
            let opisiteTranslate = (topTranslate - translate)

            if i <= ed + 1, i >= sd {
                let centeredX = getCenteredXPosition(rect, itemPos: CGFloat(i), dotSize: width, space: space, numberOfPages: numberOfPages)
                var y = rect.origin.y + centeredYPosition
                var x = centeredX + ((width + space) * floor(CGFloat(numberOfPages) / 2)) - (currentItem * (width + space))
                if i == ed + 1 {
                    y += (opisiteTranslate * widthRatio) / 2
                    x += (opisiteTranslate * widthRatio) / 2
                    let newWidth = CGFloat(width - (opisiteTranslate * widthRatio))
                    let newHeight = CGFloat(size - (opisiteTranslate * heightRatio))

                    drawItem(CGRect(x: x, y: y, width: newWidth, height: newHeight), raduis: radius, color: dotsColor)

                } else if i == ed {
                    y += ((endsDotScale * size) / 2) - ((translate * heightRatio) / 2)
                    x += (endsDotScale * width) / 2 - (translate * widthRatio) / 2

                    let newWidth = CGFloat(width - endsDotScale * width + (translate * widthRatio))
                    let newHeight = CGFloat(size - endsDotScale * size + (translate * heightRatio))

                    drawItem(CGRect(x: x, y: y, width: newWidth, height: newHeight), raduis: radius, color: dotsColor)

                } else if i == sd + 1 {
                    y += (translate * widthRatio) / 2
                    x += (translate * widthRatio) / 2
                    let newWidth = CGFloat(width - (translate * widthRatio))
                    let newHeight = CGFloat(size - (translate * heightRatio))

                    drawItem(CGRect(x: x, y: y, width: newWidth, height: newHeight), raduis: radius, color: dotsColor)

                } else if i == sd {
                    y += ((endsDotScale * size) / 2) + ((translate * heightRatio) / 2)
                    x += (endsDotScale * width) / 2 + (translate * widthRatio) / 2
                    let newWidth = CGFloat(width - endsDotScale * width - (translate * widthRatio))
                    let newHeight = CGFloat(size - endsDotScale * size - (translate * heightRatio))

                    drawItem(CGRect(x: x, y: y, width: newWidth, height: newHeight), raduis: radius, color: dotsColor)

                } else if i == center {
                    let translate = (centerScale * width) * (currentItem - floor(currentItem))

                    y += -((centerScale * size) / 2) + ((translate * heightRatio) / 2)
                    x += -((centerScale * width) / 2) + (translate * widthRatio) / 2
                    let newWidth = CGFloat(width + (centerScale * width) - (translate * widthRatio))
                    let newHeight = CGFloat(size + (centerScale * size) - (translate * heightRatio))
                    let color = (dotsColor * Double(progress)) + (indicatorColor * Double(1 - progress))
                    drawItem(CGRect(x: x, y: y, width: newWidth, height: newHeight), raduis: radius, color: color)

                } else if i == center + 1 {
                    let translate = (centerScale * width) * (currentItem - floor(currentItem))

                    y += -((translate * heightRatio) / 2)
                    x += -(translate * widthRatio) / 2

                    let newWidth = CGFloat(width + (translate * widthRatio))
                    let newHeight = CGFloat(size + (translate * heightRatio))
                    let color = (indicatorColor * Double(progress)) + (dotsColor * Double(1 - progress))
                    drawItem(CGRect(x: x, y: y, width: newWidth, height: newHeight), raduis: radius, color: color)

                } else {
                    let newWidth = CGFloat(width)
                    let newHeight = CGFloat(size)
                    drawItem(CGRect(x: x, y: y, width: newWidth, height: newHeight), raduis: radius, color: dotsColor)
                }
            }
        }
    }
}
