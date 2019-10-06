class QuizQuestion {
    // MARK: Properties
    
    var question: String
    var rightAnswer: Int
    var answers: [String]
    var timeInVideo: Int?
    
    init(question: String, rightAnswer: Int, answers: [String], timeInVideo: Int? = nil) {
        self.question = question
        self.rightAnswer = rightAnswer
        self.answers = answers
        self.timeInVideo = timeInVideo
    }
}
