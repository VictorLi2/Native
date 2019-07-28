import UIKit

class WritingLesson {
    var title: String
    var image: UIImage?
    
    init?(title: String, image: UIImage) {
        if(title.isEmpty) {
            return nil
        }
        
        self.title = title
        self.image = image
    }
}
