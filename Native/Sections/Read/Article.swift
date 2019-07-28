import UIKit

class Article {
    //MARK: Properties
    var title: String
    var source: String
    var image: UIImage
    var content: String
    
    init?(title: String, source: String, image: UIImage, content: String) {
        if(title.isEmpty || source.isEmpty) {
            return nil
        }
        
        self.title = title
        self.source = source
        self.image = image
        self.content = content
    }
}
