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
    var currentItem: CGFloat { get set }
    var size: CGFloat { get set }

    var numberOfPages: Int { get set }
    func draw(_ rect: CGRect)
}

public class AdvancedPageControlDrawerParentWithIndicator: AdvancedPageControlDrawerParent {
    var indicatorBorderColor: UIColor
    var indicatorBorderWidth: CGFloat
    var indicatorColor: UIColor
    public init(numberOfPages: Int? = 5,
                height: CGFloat? = 16,
                width: CGFloat? = 16,
                space: CGFloat? = 16,
                raduis: CGFloat? = 8,
                currentItem: CGFloat? = 0,
                indicatorColor: UIColor? = .white,
                dotsColor: UIColor? = UIColor.lightGray,
                isBordered: Bool = false,
                borderColor: UIColor = .white,
                borderWidth: CGFloat = 1,
                indicatorBorderColor: UIColor = .white,
                indicatorBorderWidth: CGFloat = 2)
    {
        self.indicatorBorderColor = indicatorBorderColor
        self.indicatorBorderWidth = indicatorBorderWidth
        self.indicatorColor = indicatorColor!
        super.init(numberOfPages: numberOfPages,
                   height: height,
                   width: width,
                   space: space,
                   raduis: raduis,
                   currentItem: currentItem,
                   dotsColor: dotsColor,
                   isBordered: isBordered,
                   borderColor: borderColor,
                   borderWidth: borderWidth)
    }
}

public class AdvancedPageControlDrawerParent {
    public var numberOfPages: Int
    public var size: CGFloat
    public var currentItem: CGFloat
    public var items = [Int]()
    var width: CGFloat
    var space: CGFloat
    var radius: CGFloat
    var dotsColor: UIColor
    var isBordered: Bool
    var borderColor: UIColor
    var borderWidth: CGFloat

    public init(numberOfPages: Int? = 5,
                height: CGFloat? = 16,
                width: CGFloat? = 16,
                space: CGFloat? = 16,
                raduis: CGFloat? = 16,
                currentItem: CGFloat? = 0,
                dotsColor: UIColor? = UIColor.lightGray,
                isBordered: Bool = false,
                borderColor: UIColor = .white,
                borderWidth: CGFloat = 1)
    {
        self.numberOfPages = numberOfPages!
        self.space = space!
        radius = raduis!
        self.currentItem = currentItem!
        self.dotsColor = dotsColor!
        self.width = width!
        size = height!
        self.isBordered = isBordered
        self.borderColor = borderColor
        self.borderWidth = borderWidth
    }

    func getScaleFactor(currentItem: CGFloat, ratio: CGFloat) -> CGFloat {
        let scale = currentItem - floor(currentItem)
        let scaleFactor = (scale > 0.5 ? 0.5 - (scale - 0.5) : scale) * ratio
        return scaleFactor
    }

    func getCenteredXPosition(_ rect: CGRect, itemPos: CGFloat, dotSize: CGFloat, space: CGFloat, numberOfPages: Int) -> CGFloat {
        let individualDotPos = (itemPos * (dotSize + space))
        let halfViewWidth = (rect.width / 2)
        let halfAlldotsWidthWithSpaces = ((CGFloat(numberOfPages) * (dotSize + (space - 1))) / 2.0)
        return individualDotPos - halfAlldotsWidthWithSpaces + halfViewWidth
    }

    func getCenteredYPosition(_ rect: CGRect, dotSize: CGFloat) -> CGFloat {
        let halfViewHeight = (rect.size.height / 2)
        let halfDotSize = (dotSize / 2)
        let centeredYPosition = halfViewHeight - halfDotSize
        return centeredYPosition
    }

    func drawItem(_ rect: CGRect, raduis: CGFloat, color: UIColor, borderWidth: CGFloat = 0, borderColor: UIColor = .clear, index _: Int = 0) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: raduis)
        path.lineWidth = borderWidth
        borderColor.setStroke()
        path.stroke()
        color.setFill()
        path.fill()
    }
}
