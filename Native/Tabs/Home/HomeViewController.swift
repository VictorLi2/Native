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
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height, height: collectionView.frame.height)
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
