import UIKit

class WritingLesson {
    var title: String
    
    init?(title: String) {
        if(title.isEmpty) {
            return nil
        }
        
        self.title = title
    }
}
