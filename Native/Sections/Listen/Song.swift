import UIKit

class Song {
    var title: String
    var artist: String
    //var albumArt: UIImage
    var savedName: String
    
    init?(title: String, artist: String, savedName: String) {
        if(title.isEmpty) {
            return nil
        }
        
        self.title = title
        self.artist = artist
        self.savedName = savedName
    }
}
