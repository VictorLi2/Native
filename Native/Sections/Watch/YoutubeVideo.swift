import UIKit

class YoutubeVideo: Content {
    //MARK: Properties
    var contentType: ContentType
    var id: String
    var title: String
    var source: String
    var image: UIImage
    
    init(id: String, title: String, source: String) {
        self.contentType = .watch
        self.id = id
        self.title = title
        self.source = source
        
        //Get youtube thumbnail from youtubeID
        var url = URL(string: "https://img.youtube.com/vi/\(id)/maxresdefault.jpg")
        var data = try? Data(contentsOf: url!)
        
        if(data == nil) {
            url = URL(string: "https://img.youtube.com/vi/\(id)/0.jpg")
            data = try? Data(contentsOf: url!)
        }
        
        self.image = UIImage(data: data!)!
    }
}
