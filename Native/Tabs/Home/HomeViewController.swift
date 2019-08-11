import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var recommendedCollectionView: UICollectionView!
    @IBOutlet weak var trendingCollectionView: UICollectionView!
    @IBOutlet weak var shopCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(title: "Home")
        
        recommendedCollectionView.delegate = self
        trendingCollectionView.delegate = self
        shopCollectionView.delegate = self
        
        recommendedCollectionView.dataSource = self
        trendingCollectionView.dataSource = self
        shopCollectionView.dataSource = self
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case self.recommendedCollectionView:
            let recommendedCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedCell", for: indexPath)
            return recommendedCell
            
        case self.trendingCollectionView:
            let trendingCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingCell", for: indexPath)
            return trendingCell
            
        case self.shopCollectionView:
            let shopCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopCell", for: indexPath)
            return shopCell
            
        default:
            fatalError()
        }
    }
}
