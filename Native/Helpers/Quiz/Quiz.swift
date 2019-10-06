import UIKit

class Quiz {
    // MARK: Properties
    var quizType: ContentType
    var id: String
    var title: String
    var content: [QuizQuestion]
    
    init(quizType: ContentType, id: String, title: String, content: [QuizQuestion]) {
        self.quizType = quizType
        self.id = id
        self.title = title
        self.content = content
    }
}
