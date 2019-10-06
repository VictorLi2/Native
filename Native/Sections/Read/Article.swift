import UIKit

class Article: Content {
    //MARK: Properties
    var contentType: ContentType
    var id: String
    var title: String
    var source: String
    var image: UIImage
    var content: String?
    
    init(id: String, title: String, source: String) {
        self.contentType = .read
        self.id = id
        self.title = title
        self.source = source
        self.image = UIImage(named: id)!
        self.content = getArticleContent(fileName: id)
    }
    
    private func getArticleContent(fileName: String) -> String {
        let filePath = Bundle.main.path(forResource: fileName, ofType: "txt")
        var content = ""
        
        do {
            content = try String(contentsOfFile: filePath!, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed to read from file")
            print(error)
        }
        
        return content
    }
}
