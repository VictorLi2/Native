import UIKit

class WriteTableViewCell: UITableViewCell {
    //MARK: Properties
    
    var writingLesson: WritingLesson?
    
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        title.text = writingLesson?.title
    }
}
