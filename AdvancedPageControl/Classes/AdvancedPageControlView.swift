//
//  CustomIndicatorView.swift
//  Maps
//
//  Created by Mohaned Benmesken on 12/30/19.
//  Copyright © 2019 Mohaned Benmesken. All rights reserved.
//

import Foundation
import UIKit

public class AdvancedPageControlView: UIView {
    var animDuration = 0.2

    private var mustGoCurrentItem: CGFloat = 0
    private var previuscurrentItem: CGFloat = 0
    private var displayLink: CADisplayLink?
    private var startTime = 0.0

    public var numberOfPages: Int { get { return drawer.numberOfPages } set(val) {
        setNeedsDisplay()
        drawer.numberOfPages = val
    }}

    public var drawer: AdvancedPageControlDraw = InfiniteScrollingDrawer()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .clear
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .clear
    }
    
    public func setPageOffset(_ offset: CGFloat) {
        drawer.currentItem = CGFloat(offset)
        setNeedsDisplay()
    }

    public func setPage(_ index: Int) {
        if mustGoCurrentItem != CGFloat(index) {
            previuscurrentItem = round(drawer.currentItem)
            self.mustGoCurrentItem = CGFloat(index)
            startDisplayLink()
        }
    }

    override public var intrinsicContentSize: CGSize {
        return CGSize(width: self.drawer.size, height: self.drawer.size + 16)
    }

    override public func draw(_ rect: CGRect) {
        drawer.draw(rect)
    }

    private func startDisplayLink() {
        stopDisplayLink() // make sure to stop a previous running display link
        startTime = Date.timeIntervalSinceReferenceDate // reset start time
        let displayLink = CADisplayLink(
            target: self, selector: #selector(displayLinkDidFire)
        )
        displayLink.add(to: .current, forMode: .common)
        self.displayLink = displayLink
    }

    @objc private func displayLinkDidFire(_: CADisplayLink) {
        var elapsed = Date.timeIntervalSinceReferenceDate - startTime

        if elapsed > animDuration {
            stopDisplayLink()
            elapsed = animDuration // clamp the elapsed time to the anim length
        }
        let progress = CGFloat(elapsed / animDuration)

        let sign = mustGoCurrentItem - previuscurrentItem

        drawer.currentItem = CGFloat(progress * sign + previuscurrentItem)

        setNeedsDisplay()
    }

    // invalidate display link if it's non-nil, then set to nil
    private func stopDisplayLink() {
        displayLink?.invalidate()
        displayLink = nil
    }
}
