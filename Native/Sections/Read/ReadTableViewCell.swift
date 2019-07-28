import UIKit

class ReadTableViewCell: UITableViewCell {
    //MARK: Properties
    var article: Article?
    
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var source: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        articleImage.image = article?.image
        title.text = article?.title
        source.text = article?.source
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
