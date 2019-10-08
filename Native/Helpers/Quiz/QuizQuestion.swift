struct QuizQuestion: Codable {
    var question: String
    var rightAnswer: Int
    var answers: [String]
    var timeInVideo: Int
}
