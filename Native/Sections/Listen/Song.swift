import UIKit

class Song {
    var title: String
    var artist: String
    
    init?(title: String, artist: String) {
        if(title.isEmpty) {
            return nil
        }
        
        self.title = title
        self.artist = artist
    }
}
