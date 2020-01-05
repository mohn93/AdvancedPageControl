//
//  ViewController.swift
//  AdvancedPageControl
//
//  Created by Mohanned Binmiskeen on 01/05/2020.
//  Copyright (c) 2020 Mohanned Binmiskeen. All rights reserved.
//

import UIKit
import AdvancedPageControl

class ViewController: UIViewController,
                    UICollectionViewDataSource,
                    UICollectionViewDelegate,
                    UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl1: AdvancedPageControlView!
    @IBOutlet weak var pageControl2: AdvancedPageControlView!
    @IBOutlet weak var pageControl3: AdvancedPageControlView!
    @IBOutlet weak var pageControl4: AdvancedPageControlView!
    @IBOutlet weak var pageControl5: AdvancedPageControlView!
    @IBOutlet weak var pageControl6: AdvancedPageControlView!
    @IBOutlet weak var pageControl7: AdvancedPageControlView!
    @IBOutlet weak var pageControl8: AdvancedPageControlView!
    @IBOutlet weak var pageControl9: AdvancedPageControlView!
    @IBOutlet weak var pageControl10: AdvancedPageControlView!
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 250)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        
        pageControl1.setCurrentItem(offset: CGFloat(offSet),width: CGFloat(width))
        pageControl2.setCurrentItem(offset: CGFloat(offSet),width: CGFloat(width))
        pageControl3.setCurrentItem(offset: CGFloat(offSet),width: CGFloat(width))
        pageControl4.setCurrentItem(offset: CGFloat(offSet),width: CGFloat(width))
        pageControl5.setCurrentItem(offset: CGFloat(offSet),width: CGFloat(width))
        pageControl6.setCurrentItem(offset: CGFloat(offSet),width: CGFloat(width))
        pageControl7.setCurrentItem(offset: CGFloat(offSet),width: CGFloat(width))
        pageControl8.setCurrentItem(offset: CGFloat(offSet),width: CGFloat(width))
        pageControl9.setCurrentItem(offset: CGFloat(offSet),width: CGFloat(width))
        pageControl10.setCurrentItem(offset: CGFloat(offSet),width: CGFloat(width))
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pageControl1.numberOfPages = 5
        
        pageControl1.drawer = ColorBlendDrawer()
        pageControl2.drawer = DropDrawer()
        pageControl3.drawer = ExtendedDotDrawer()
        pageControl4.drawer = JumpDrawer()
        pageControl5.drawer = ScaleDrawer()
        pageControl6.drawer = SlideDrawer()
        pageControl7.drawer = SwapDrawer()
        pageControl8.drawer = ThinWormDrawer()
        pageControl9.drawer = ThinWormHeadsDrawer()
        pageControl10.drawer = WormDrawer()

    }
    
}

