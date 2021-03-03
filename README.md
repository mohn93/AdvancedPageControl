# AdvancedPageControl

[![Version](https://img.shields.io/cocoapods/v/AdvancedPageControl.svg?style=flat)](https://cocoapods.org/pods/AdvancedPageControl)
[![License](https://img.shields.io/cocoapods/l/AdvancedPageControl.svg?style=flat)](https://cocoapods.org/pods/AdvancedPageControl)
[![Platform](https://img.shields.io/cocoapods/p/AdvancedPageControl.svg?style=flat)](https://cocoapods.org/pods/AdvancedPageControl)

A simple yet powerful page control indicator animations library for iOS, Written in Swift.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

AdvancedPageControl is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AdvancedPageControl'
```

## Effects 
* Color Blend
* Drop
* ExtendedDot
* Jump
* Scale
* Slide
* Swap
* Worm
* ThinWorm
* ThinWormHead
* Scrolling
* Infinite


## Usage
I'm using it with expanded UICollectionView, create a collection view and link the DataSource and Delegate to your ViewController, and add UICollectionViewDeleageFlowLayout

```swift
class ViewController: UIViewController,
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout { ....
```

Then add these methods:

```swift
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
       return CGSize(width: collectionView.frame.width, height: 250) // This is to restric the item width and heigth to achive the single item preview
   }
```

Tick 'Scrolling enabled' and 'Paging enabled' Checkboxes in storyboard UICollectionView properties

Then add this method and pass the offset of the scrolling for UICollectionView, and width of the UICollectionView, to the pageControl , setCurrentItem, Method

```swift
func scrollViewDidScroll(_ scrollView: UIScrollView) {
      let offSet = scrollView.contentOffset.x
      let width = scrollView.frame.width
      
      pageControl.setPageOffset(offSet/width)
      
      // OR
      let index = Int(round(offSet/width))
      pageControl.setPage(index) // This will animate the page controll transition, whenever the index is changed, no need to pass an offset of every scroll offset

  }
```

Then set any drawer you like in viewDidLoad Method  :

```swift
pageControl1.drawer = ColorBlendDrawer()
```

or you can pick one of these

```swift
ColorBlendDrawer()
DropDrawer()
ExtendedDotDrawer()
JumpDrawer()
ScaleDrawer()
SlideDrawer()
SwapDrawer()
ThinWormDrawer()
ThinWormHeadsDrawer()
WormDrawer()
Scrolling()
Infinite()
```

![Alt Text](https://github.com/mohn93/AdvancedPageControl/blob/master/Example/advanced-page-control-demo.gif)

## Customization
```swift
ScaleDrawer(numberOfPages:Int? = 5,
            height: CGFloat? = 16,
            width: CGFloat? = 16,
            space: CGFloat? = 16,
            radius: CGFloat? = 16,
            currentItem: CGFloat? = 0,
            indicatorColor: UIColor? = .red,
            dotsColor: UIColor? = .lightGray)
```




## Author

Mohanned Binmiskeen, mohn93@gmail.com

## License

AdvancedPageControl is available under the MIT license. See the LICENSE file for more info.
