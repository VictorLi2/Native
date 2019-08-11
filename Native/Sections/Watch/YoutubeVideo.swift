import UIKit

class YoutubeVideo: NSObject, NSCoding {
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
        
        super.init()
        self.thumbnail = generateThumbnailFromYouTubeID(youTubeID: id)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(title, forKey: "title")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeObject(forKey: "id") as! String
        let title = aDecoder.decodeObject(forKey: "title") as! String
        self.init(id: id, title: title)
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
