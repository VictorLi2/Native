import UIKit

class WatchTableViewCell: UITableViewCell {
    //MARK: Properties
    var youtubeVideo: YoutubeVideo?
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    var youtubeID: String?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        thumbnail.image = youtubeVideo?.thumbnail
        title.text = youtubeVideo?.title
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
