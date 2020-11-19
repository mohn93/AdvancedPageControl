//
//  InfiniteScrollingDrawer.swift
//  AdvancedPageControl
//
//  Created by Mohaned Benmesken on 3/12/20.
//

import Foundation

import UIKit

public class InfiniteScrollingDrawer:AdvancedPageControlDrawerParentWithIndicator, AdvancedPageControlDraw {
    let endsDotScale:CGFloat = 0.5
    var centerScale:CGFloat = 1.5
    var visibleDots:Int = 5
    
    public func draw(_ rect: CGRect) {
        drawIndicators(rect)
    }
    
    func drawIndicators(_ rect: CGRect) {
        let centeredYPosition = getCenteredYPosition(rect, dotSize: height)
        for i in 0..<numberOfPages{
            let topTranslate = width
            
            let progress = currentItem - (floor(currentItem))
            let translate = ( endsDotScale * width) * (currentItem - (floor(currentItem)))
            let ed = Int(floor(currentItem) + ceil(CGFloat(visibleDots)))
            let sd = Int(floor(currentItem) - ceil(CGFloat(visibleDots))/2) + 2
            let center = Int(floor(currentItem))
            let widthRatio = width / height
            let heightRatio  =  height / width
            let opisiteTranslate = (topTranslate - translate)
            
            if i <= ed + 1  && i >= sd {
                let centeredX  = getCenteredXPosition(rect,itemPos: CGFloat(i), dotSize: width,space: space, numberOfPages: min(visibleDots,numberOfPages))
                var y =  rect.origin.y + centeredYPosition
                
                var x =  centeredX  - (currentItem * (width + space))
                if i == ed+1  {
                    
                    y += (opisiteTranslate * heightRatio) / 2
                    x += (opisiteTranslate * widthRatio) / 2
                    let newWidth = CGFloat(width - (opisiteTranslate * widthRatio))
                    let newHeight = CGFloat(height - (opisiteTranslate * heightRatio))
                    
                    drawItem(CGRect(x: x, y:  y, width: newWidth , height: newHeight), raduis:radius, color: dotsColor,index: i%visibleDots)
                    
                } else if i == ed  {
                    
                    y += ((endsDotScale * height) / 2) - ((translate * heightRatio) / 2)
                    x += (endsDotScale * width) / 2 - (translate * widthRatio) / 2
                    
                    let newWidth = CGFloat(width  - endsDotScale * width + (translate * widthRatio) )
                    let newHeight = CGFloat(height - endsDotScale * height + (translate * heightRatio) )
                    
                    drawItem(CGRect(x: x, y:  y, width: newWidth , height: newHeight), raduis:radius, color: dotsColor,index: i%visibleDots)
                    
                } else  if i == sd+1{
                    
                    y += (translate * heightRatio) / 2
                    x += (translate * widthRatio) / 2
                    
                    let newRadius = radius - ((translate ) / 2)

                    let newWidth = CGFloat(width - (translate * widthRatio))
                    let newHeight = CGFloat(height - (translate * heightRatio))
                    
                    drawItem(CGRect(x: x, y:  y, width: newWidth , height: newHeight), raduis:radius, color: dotsColor,index: i%visibleDots)
                    
                } else if i == sd {
                    
                    y += ((endsDotScale * height) / 2) + ((translate * heightRatio) / 2)
                    x += (endsDotScale * width) / 2 + (translate * widthRatio) / 2
                    let newRadius = radius - (endsDotScale / 2) - (translate / 2)
                    let newWidth = CGFloat(width  - endsDotScale * width - (translate * widthRatio) )
                    let newHeight = CGFloat(height - endsDotScale * height - (translate * heightRatio) )
                    
                    drawItem(CGRect(x: x, y:  y, width: newWidth , height: newHeight), raduis:radius, color: .yellow,index: i%visibleDots)
                    
                } else if i == center {
                    let scale = CGFloat(1.2)
                    
                    let translate = (centerScale * width) * (currentItem - (floor(currentItem)))
                    
                    y += -((centerScale * height) / 2) + ((translate * heightRatio) / 2)
                    x += -((centerScale * width) / 2) + (translate * widthRatio) / 2
                    let newWidth = CGFloat(width + ((centerScale * width) ) - (translate * widthRatio) )
                    let newHeight = CGFloat(height +  ((centerScale * height) ) - (translate * heightRatio) )
                    let color = (dotsColor * Double(progress) ) + (indicatorColor * Double(1 - progress) )
                    let newRadius = radius - centerScale/2 + translate/2
                    drawItem(CGRect(x: x, y:  y, width: newWidth, height: newHeight), raduis:radius, color: color,index: i%visibleDots)
                    
                } else if i == center + 1 {
                    let translate = (centerScale * width) * (currentItem - (floor(currentItem)))
                    
                    y += -((translate * heightRatio) / 2)
                    x += -(translate * widthRatio) / 2
                    
                    let newWidth = CGFloat(width + (translate * widthRatio) )
                    let newHeight = CGFloat(height + (translate * heightRatio) )
                    let color = (indicatorColor * Double(progress)) + (dotsColor * Double(1 - progress) )
                    let newRadius = radius - translate / 2
                    drawItem(CGRect(x: x, y: y, width: newWidth, height: newHeight), raduis:radius, color: color,index: i%visibleDots)
                    
                } else {
                    
                    let newWidth = CGFloat(width )
                    let newHeight = CGFloat(height)
                    drawItem(CGRect(x: x, y: y, width: newWidth, height: newHeight), raduis:radius,color: dotsColor,index: i%visibleDots)
                    
                }
            }
        }
    }
}
