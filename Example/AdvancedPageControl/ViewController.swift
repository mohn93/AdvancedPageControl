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
    @IBOutlet weak var pageControl11: AdvancedPageControlView!
    @IBOutlet weak var pageControll12: AdvancedPageControlView!
    
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
        
        pageControl1.setPage(Int(round(offSet/width)))
        pageControl2.setPage(Int(round(offSet/width)))
        pageControl3.setPageOffset(offSet/width)
        pageControl4.setPage(Int(round(offSet/width)))
        pageControl5.setPage(Int(round(offSet/width)))
        pageControl6.setPage(Int(round(offSet/width)))
        pageControl7.setPage(Int(round(offSet/width)))
        pageControl8.setPage(Int(round(offSet/width)))
        pageControl9.setPage(Int(round(offSet/width)))
        pageControl10.setPage(Int(round(offSet/width)))
        pageControl11.setPage(Int(round(offSet/width)))
        pageControll12.setPage(Int(round(offSet/width)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.layer.cornerRadius = 32
        pageControl1.drawer = ColorBlendDrawer()
        pageControl2.drawer = DropDrawer()
        pageControl3.drawer = ExtendedDotDrawer( dotsColor: .gray,
                                                 isBordered:true,
                                                 borderColor: .white)
        pageControl4.drawer = JumpDrawer()
        pageControl5.drawer = ScaleDrawer()
        pageControl6.drawer = SlideDrawer()
        pageControl7.drawer = SwapDrawer( dotsColor: .clear,
                                          isBordered:true,
                                          borderColor: .white,
                                          borderWidth: 2)
        
        pageControl8.drawer = ThinWormDrawer()
        pageControl9.drawer = ThinWormHeadsDrawer()
        pageControl10.drawer = WormDrawer()
        pageControl11.drawer = InfiniteDrawer(numberOfPages:5,indicatorColor: .white)
        pageControll12.drawer = ScrollingDrawer(numberOfPages:5)
        
    }
}

