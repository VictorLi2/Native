import UIKit

class YoutubeVideo {
    //MARK: Properties
    
    var id: String
    var title: String
    var thumbnail: UIImage?
    
    init?(id: String, title: String) {
        if(id.isEmpty || title.isEmpty) {
            return nil
        }
        
        self.id = id
        self.title = title
        self.thumbnail = generateThumbnailFromYouTubeID(youTubeID: id)
    }
    
    private func generateThumbnailFromYouTubeID(youTubeID: String) -> UIImage {
        var url = URL(string: "https://img.youtube.com/vi/\(youTubeID)/maxresdefault.jpg")
        var data = try? Data(contentsOf: url!)
        
        if(data == nil) {
            url = URL(string: "https://img.youtube.com/vi/\(youTubeID)/0.jpg")
            data = try? Data(contentsOf: url!)
        }
        
        return UIImage(data: data!)!
    }
}
