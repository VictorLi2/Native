import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var recommendedCollectionView: UICollectionView!
    @IBOutlet weak var trendingCollectionView: UICollectionView!
    @IBOutlet weak var shopCollectionView: UICollectionView!
    @IBOutlet weak var musicCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(title: "Home")
        
        recommendedCollectionView.delegate = self
        trendingCollectionView.delegate = self
        shopCollectionView.delegate = self
        musicCollectionView.delegate = self
        
        recommendedCollectionView.dataSource = self
        trendingCollectionView.dataSource = self
        shopCollectionView.dataSource = self
        musicCollectionView.dataSource = self
        
        recommendedCollectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "RecommendedCell")
        trendingCollectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "TrendingCell")
        shopCollectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "ShopCell")
        musicCollectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "MusicCell")
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        let bounds = scrollView.bounds
        let xTarget = targetContentOffset.pointee.x
        
        // This is the max contentOffset.x to allow. With this as contentOffset.x, the right edge of the last column of cells is at the right edge of the collection view's frame.
        let xMax = scrollView.contentSize.width - scrollView.bounds.width
        
        if abs(velocity.x) <= snapToMostVisibleColumnVelocityThreshold {
            let xCenter = scrollView.bounds.midX
            let poses = layout.layoutAttributesForElements(in: bounds) ?? []
            // Find the column whose center is closest to the collection view's visible rect's center.
            let x = poses.min(by: { abs($0.center.x - xCenter) < abs($1.center.x - xCenter) })?.frame.origin.x ?? 0
            targetContentOffset.pointee.x = x
        } else if velocity.x > 0 {
            let poses = layout.layoutAttributesForElements(in: CGRect(x: xTarget, y: 0, width: bounds.size.width, height: bounds.size.height)) ?? []
            // Find the leftmost column beyond the current position.
            let xCurrent = scrollView.contentOffset.x
            let x = poses.filter({ $0.frame.origin.x > xCurrent}).min(by: { $0.center.x < $1.center.x })?.frame.origin.x ?? xMax
            targetContentOffset.pointee.x = min(x, xMax)
        } else {
            let poses = layout.layoutAttributesForElements(in: CGRect(x: xTarget - bounds.size.width, y: 0, width: bounds.size.width, height: bounds.size.height)) ?? []
            // Find the rightmost column.
            let x = poses.max(by: { $0.center.x < $1.center.x })?.frame.origin.x ?? 0
            targetContentOffset.pointee.x = max(x, 0)
        }
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case self.recommendedCollectionView:
            let recommendedCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedCell", for: indexPath) as! HomeCollectionViewCell
            return recommendedCell
            
        case self.trendingCollectionView:
            let trendingCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingCell", for: indexPath) as! HomeCollectionViewCell
            return trendingCell
            
        case self.shopCollectionView:
            let shopCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopCell", for: indexPath) as! HomeCollectionViewCell
            return shopCell
        case self.musicCollectionView:
            let musicCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MusicCell", for: indexPath) as! HomeCollectionViewCell
            return musicCell
        default:
            fatalError()
        }
    }
}
