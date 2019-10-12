import UIKit

class Song: Content {
    var contentType: ContentType
    var id: String
    var title: String
    var source: String
    var image: UIImage
    
    init(title: String, source: String) {
        self.contentType = .listen
        self.id = title
        self.title = title
        self.source = source
        self.image = UIImage(named: id)!
    }
}
