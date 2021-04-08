//
//  ColorUtils.swift
//  Maps
//
//  Created by Mohaned Benmesken on 12/31/19.
//  Copyright © 2019 Mohaned Benmesken. All rights reserved.
//

import Foundation
import UIKit

public func addColor(_ color1: UIColor, with color2: UIColor) -> UIColor {
    var (r1, g1, b1, a1) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))
    var (r2, g2, b2, a2) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))

    color1.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
    color2.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)

    // add the components, but don't let them go above 1.0
    return UIColor(red: min(r1 + r2, 1), green: min(g1 + g2, 1), blue: min(b1 + b2, 1), alpha: (a1 + a2) / 2)
}

public func multiplyColor(_ color: UIColor, by multiplier: CGFloat) -> UIColor {
    var (r, g, b, a) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))
    color.getRed(&r, green: &g, blue: &b, alpha: &a)
    return UIColor(red: r * multiplier, green: g * multiplier, blue: b * multiplier, alpha: a)
}

public func + (color1: UIColor, color2: UIColor) -> UIColor {
    return addColor(color1, with: color2)
}

public func * (color: UIColor, multiplier: Double) -> UIColor {
    return multiplyColor(color, by: CGFloat(multiplier))
}
