import UIKit

class Song {
    var title: String
    var artist: String
    var albumArt: UIImage
    
    init?(title: String, artist: String, albumArt: UIImage) {
        if(title.isEmpty) {
            return nil
        }
        
        self.title = title
        self.artist = artist
        self.albumArt = albumArt
    }
}
