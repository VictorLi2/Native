import UIKit

class ListenTableViewCell: UITableViewCell {
    //MARK: Properties
    
    var song: Song?
    
    @IBOutlet weak var albumArt: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var artist: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        albumArt.image = song?.albumArt
        title.text = song?.title
        artist.text = song?.artist
    }
}
