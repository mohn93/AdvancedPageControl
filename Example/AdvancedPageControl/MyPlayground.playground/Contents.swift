
let a = 5.0 * 5.123
import Foundation

var today =  Date();
let dateFormatterGet = DateFormatter()
dateFormatterGet.dateFormat = "HH:mm:ss"
let startTime = dateFormatterGet.date(from: "21:00:00")!
let endTime = dateFormatterGet.date(from: "08:00:00")!

let startComponents = Calendar.current.dateComponents(in: .current, from: startTime)
let endComponents = Calendar.current.dateComponents(in: .current, from: endTime)

let startDate = Calendar.current.date(bySettingHour: startComponents.hour!, minute: startComponents.minute!, second: startComponents.second!, of: Date())!
let endDate = Calendar.current.date(bySettingHour: endComponents.hour!, minute: endComponents.minute!, second: endComponents.second!, of: Date())!

let isoDate = "2020-04-09 06:00:00"

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
let nowDate = dateFormatter.date(from:isoDate)!

print(startDate)
print(endDate)
print(nowDate)

var isBetween = false
var periodDate = Date()
var endDateAdded = endDate
if startDate > endDate {
    print("bigger than")
    if nowDate<=endDate || nowDate>=startDate{
        print("between")
        isBetween = true
        endDateAdded = Calendar.current.date(byAdding: .day,value: 1, to: endDate)!
        //        print(endDateAdded)
    }
    
}else{
    
    print("bigger than")
    if nowDate<=endDate && nowDate>=startDate{
        print("between")
        isBetween = true
        //        periodDate = startDate - endDate
    }
}

let periodDateComponents = Calendar.current.dateComponents(in: .current, from: periodDate)
//periodDateComponents.date
//periodDate.
let totalTime =  endDateAdded - startDate.timeIntervalSince1970
print(totalTime.timeIntervalSince1970)
let passedTime = startDate - nowDate.timeIntervalSince1970
print(passedTime.timeIntervalSince1970)
let leftTime = totalTime - passedTime.timeIntervalSince1970
print(leftTime.timeIntervalSince1970)
let passedTimePercent = Int(passedTime.timeIntervalSince1970 / totalTime.timeIntervalSince1970 * 100)
let leftTimePercent = Int(leftTime.timeIntervalSince1970 / totalTime.timeIntervalSince1970 * 100)


//var myToday =  Date(today., today.getMonth(), today.getDate(), 0, 0, 0);

print(type(of: a))
///: A UIKit based Playground for presenting user interface
//
//import UIKit
//import PlaygroundSupport
//import AdvancedPageControl
//
////class MyViewController : UIViewController {
////
////}
//// Present the view controller in the Live View window
//
//
//class MyViewController: UIViewController,
//UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
//
//    var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//        return collectionView
//    }()
//
//    var stackView: UIStackView = {
//        let view = UIStackView()
//        view.axis = .vertical
//        view.alignment = .fill
//        view.distribution = .equalSpacing
//        return view
//    }()
//
//    var pageControl1 =  AdvancedPageControlView()
//
//    override func loadView() {
//
//        let view = UIView()
//        self.view = view
//
//        view.backgroundColor = .white
//
//        collectionView.delegate = self
//        collectionView.dataSource = self
//
//        pageControl1.backgroundColor = .gray
//        pageControl1.drawer = ScaleDrawer()
//        pageControl1.translatesAutoresizingMaskIntoConstraints = false
//
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        print("new")
//        view.addSubview(collectionView)
//        view.addSubview(stackView)
//
//        activateCollectionViewConstraints()
//        activateStackViewConstraints()
//
//        stackView.addArrangedSubview(pageControl1)
//
//    }
//
//    func activateStackViewConstraints()  {
//        stackView.topAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
//        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        stackView.heightAnchor.constraint(equalToConstant: 200).isActive = true
//        stackView.backgroundColor = .clear
//    }
//
//    func activateCollectionViewConstraints()  {
//        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        collectionView.heightAnchor.constraint(equalToConstant: 250).isActive = true
//        collectionView.backgroundColor = .clear
//        collectionView.isPagingEnabled = true
//    }
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 11
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//        cell.largeContentTitle = "dfs"
//        return cell
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.width, height: 250)
//    }
//
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let offSet = scrollView.contentOffset.x
//        let width = scrollView.frame.width
////        print(offSet)
////        pageControl1.setCurrentItem(offset: CGFloat(offSet),width: CGFloat(width))
//
//                        pageControl1.setPage(Int(round(offSet / width)))
//
//
//    }
//
//    //    override func viewDidLoad() {
//    //        super.viewDidLoad()
//    //        collectionView.delegate = self
//    //        collectionView.dataSource = self
//    //
//    //
//    //        pageControl1.numberOfPages = 5
//    //
//    //        pageControl1.drawer = ColorBlendDrawer()
//    ////        pageControl2.drawer = DropDrawer()
//    ////        pageControl3.drawer = ExtendedDotDrawer( dotsColor: .clear, isBordered:true,borderColor: .white)
//    ////        pageControl4.drawer = JumpDrawer()
//    ////        pageControl5.drawer = ScaleDrawer()
//    ////        pageControl6.drawer = SlideDrawer()
//    ////        pageControl7.drawer = SwapDrawer( dotsColor: .clear, isBordered:true,borderColor: .white,borderWidth: 2)
//    ////        pageControl8.drawer = ThinWormDrawer()
//    ////        pageControl9.drawer = ThinWormHeadsDrawer()
//    ////        pageControl10.drawer = WormDrawer()
//    ////        pageControl11.drawer = InfiniteScrollingDrawer(numberOfPages:7,indicatorColor: .white)
//    ////        pageControll12.drawer = ScrollingDrawer()
//    //
//    //    }
//}
//PlaygroundPage.current.liveView = MyViewController()
import UIKit
import Foundation
import PlaygroundSupport
class FromToView :UIView{
    var startTime:UILabel = {
        
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "12:00"
        view.textAlignment = .center
        view.font = UIFont(name: view.font.familyName, size: 34)
        return view
        
    }()
    
    var startTimeProgressView:UIView = {
        let view = UIView()
        view.backgroundColor = .cyan
        return view
    }()
    
    var endTimeProgressView:UIView = {
        let view = UIView()
        view.backgroundColor = .cyan
        return view
    }()
    
    
    var startTimeAmPm:UILabel = {
        
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "AM"
        view.font = UIFont(name: view.font.familyName, size: 14)
        return view
        
    }()
    
    var endTime:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "10:00"
        view.font = UIFont(name: view.font.familyName, size: 34)
        view.textAlignment = .center
        return view
    }()
    
    var endTimeAmPm:UILabel = {
        
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "PM"
        view.font = UIFont(name: view.font.familyName, size: 14)
        return view
        
    }()
    
    var startTimeView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        view.layer.cornerRadius = 16
        return view
    }()
    
    var endTimeView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        view.layer.cornerRadius = 16
        
        return view
    }()
    
    
    var toLbl: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.text = "to"
        return view
    }()
    
    var currentTimeLbl:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "10:00"
        view.font = UIFont(name: view.font.familyName, size: 14)
        return view
    }()
    
    var currentTimeIndicatorView:UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 2).isActive = true
        view.heightAnchor.constraint(equalToConstant: 34).isActive = true
        return view
    }()
    
    lazy var currentTimeView:UIStackView = {
        let view = UIStackView(arrangedSubviews: [currentTimeLbl,currentTimeIndicatorView])
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.alignment = .bottom
        view.spacing = 4
        // view.widthAnchor.constraint(equalToConstant: 2).isActive = true
        // view.heightAnchor.constraint(equalToConstant: 34).isActive = true
        return view
    }()
    
    var expireTimeLbl:UILabel = {
         let view = UILabel()
         view.translatesAutoresizingMaskIntoConstraints = false
         view.text = "10:00"
         view.font = UIFont(name: view.font.familyName, size: 14)
         return view
     }()
     
     var expireTimeIndicatorView:UIView = {
         let view = UIView()
         view.backgroundColor = .green
         view.translatesAutoresizingMaskIntoConstraints = false
         view.widthAnchor.constraint(equalToConstant: 2).isActive = true
         view.heightAnchor.constraint(equalToConstant: 34).isActive = true
         return view
     }()
     
     lazy var expireTimeView:UIStackView = {
         let view = UIStackView(arrangedSubviews: [expireTimeIndicatorView, expireTimeLbl])
         view.backgroundColor = .gray
         view.translatesAutoresizingMaskIntoConstraints = false
         view.axis = .horizontal
         view.alignment = .bottom
         view.spacing = 4
         return view
     }()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView()  {
        backgroundColor = .white
        startTimeView.addSubview(startTimeProgressView)
        startTimeView.addSubview(startTime)
        startTimeView.addSubview(startTimeAmPm)
        
        endTimeView.addSubview(endTime)
        endTimeView.addSubview(endTimeAmPm)
        
        //        addSubview(currentTimeIndicatorView)
        //        addSubview(currentTimeLbl)
        addSubview(currentTimeView)
        addSubview(expireTimeView)
        addSubview(startTimeView)
        addSubview(endTimeView)
        addSubview(toLbl)
        
        toLbl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        toLbl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        startTimeView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        startTimeView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        startTimeView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -16).isActive = true
        startTimeView.trailingAnchor.constraint(equalTo: toLbl.leadingAnchor,constant: -16).isActive = true
        
        //        startTime.leadingAnchor.constraint(equalTo: startTimeView.leadingAnchor).isActive = true
        startTime.centerXAnchor.constraint(equalTo: startTimeView.centerXAnchor).isActive = true
        startTime.centerYAnchor.constraint(equalTo: startTimeView.centerYAnchor).isActive = true
        
        startTimeAmPm.leadingAnchor.constraint(equalTo: startTime.trailingAnchor,constant: 8).isActive = true
        startTimeAmPm.bottomAnchor.constraint(equalTo: startTime.bottomAnchor,constant: -4).isActive = true
        
        endTimeView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        endTimeView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        endTimeView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -16).isActive = true
        endTimeView.leadingAnchor.constraint(equalTo: toLbl.trailingAnchor,constant: 16).isActive = true
        
        //        endTime.leadingAnchor.constraint(equalTo: endTimeView.leadingAnchor).isActive = true
        endTime.centerXAnchor.constraint(equalTo: endTimeView.centerXAnchor).isActive = true
        endTime.centerYAnchor.constraint(equalTo: endTimeView.centerYAnchor).isActive = true
        
        endTimeAmPm.leadingAnchor.constraint(equalTo: endTime.trailingAnchor,constant: 8).isActive = true
        endTimeAmPm.bottomAnchor.constraint(equalTo: endTime.bottomAnchor,constant: -4).isActive = true
        
//        currentTimeIndicatorView.topAnchor.constraint(equalTo: startTimeView.bottomAnchor,constant: -16).isActive = true
//        currentTimeIndicatorView.leadingAnchor.constraint(equalTo: startTimeView.leadingAnchor,constant: 16).isActive = true
//        currentTimeLbl.bottomAnchor.constraint(equalTo: currentTimeIndicatorView.bottomAnchor).isActive = true
//        currentTimeLbl.trailingAnchor.constraint(equalTo: currentTimeIndicatorView.leadingAnchor,constant: -4).isActive = true
//        //        currentTimeIndicatorView.transform = .init(translationX: 20, y: 0)
        
        currentTimeView.topAnchor.constraint(equalTo: startTimeView.bottomAnchor,constant: -16).isActive = true
        currentTimeView.trailingAnchor.constraint(equalTo: startTimeView.leadingAnchor,constant: 2).isActive = true
        
        expireTimeView.topAnchor.constraint(equalTo: startTimeView.bottomAnchor,constant: -16).isActive = true
        expireTimeView.leadingAnchor.constraint(equalTo: startTimeView.leadingAnchor).isActive = true

        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        currentTimeView.transform = .init(translationX: 100, y: 0)
    }
}

PlaygroundPage.current.liveView = FromToView(frame: CGRect(x: 0, y: 0, width: 400
    , height: 100))


