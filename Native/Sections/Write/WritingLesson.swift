import UIKit

class WritingLesson: Content {
    var contentType: ContentType
    var id: String
    var title: String
    var source: String
    var image: UIImage
    
    init(title: String, source: String, image: UIImage) {
        self.contentType = .write
        self.id = title
        self.title = title
        self.source = source
        self.image = image
    }
}
