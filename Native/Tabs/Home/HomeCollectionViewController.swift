import UIKit

class HomeCollectionViewController: UICollectionViewController {
    var delegate: HomeTableViewController?
    var contentArray: [Content]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.decelerationRate = .fast
    }


    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize.width = min(collectionView.bounds.size.width - 20, 400)
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentArray!.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt
        indexPath: IndexPath) -> UICollectionViewCell {
        
        var cellIdentifier: String
        
        switch (contentArray![indexPath.row].contentType) {
        case .listen:
            cellIdentifier = "1x1HomeCollectionCell"
        default:
            cellIdentifier = "16x9HomeCollectionCell"
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! HomeCollectionCell
        cell.content = contentArray![indexPath.row]
        return cell
    }
    
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

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch (contentArray![indexPath.row].contentType) {
        case .read:
            let readViewController = storyboard?.instantiateViewController(withIdentifier: "ReadViewController") as! ReadViewController
            readViewController.article = contentArray![indexPath.row] as? Article
            delegate?.navigationController?.pushViewController(readViewController, animated: true)
        case .watch:
            let watchViewController = storyboard?.instantiateViewController(withIdentifier: "WatchViewController") as! YoutubeViewController
            watchViewController.youtubeVideo = contentArray![indexPath.row] as? YoutubeVideo
            delegate?.navigationController?.pushViewController(watchViewController, animated: true)
        case .listen:
            let listenViewController = storyboard?.instantiateViewController(withIdentifier: "ListenViewController") as! ListenMusicViewController
            listenViewController.song = contentArray![indexPath.row] as? Song
            delegate?.navigationController?.pushViewController(listenViewController, animated: true)
        case .write:
            let writeViewController = storyboard?.instantiateViewController(withIdentifier: "WriteViewController") as! WriteViewController
            writeViewController.writingLesson = contentArray![indexPath.row] as? WritingLesson
            delegate?.navigationController?.pushViewController(writeViewController, animated: true)
        }
    }
    
    // Velocity is measured in points per millisecond.
    private var snapToMostVisibleColumnVelocityThreshold: CGFloat { return 0.3 }

}

class HomeCollectionCell: UICollectionViewCell {
    var content: Content?

    @IBOutlet weak var contentImage: UIImageView!
    @IBOutlet weak var contentTypeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentImage.image = content?.image
        contentTypeLabel.text = getContentType()
        titleLabel.text = content?.title
        sourceLabel.text = content?.source
        
        titleLabel.lineBreakMode = .byTruncatingTail
        sourceLabel.lineBreakMode = .byTruncatingTail
        contentTypeLabel.numberOfLines = 1
        titleLabel.numberOfLines = 3
        sourceLabel.numberOfLines = 1
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentImage.image = nil
        contentTypeLabel.text = nil
        titleLabel.text = nil
        sourceLabel.text = nil
    }
    
    private func getContentType() -> String {
        switch (content?.contentType)! {
        case .read:
            return "Article:"
        case .watch:
            return "Video:"
        case .listen:
            return  "Song:"
        case .write:
            return "Writing Lesson:"
        }
    }
}
