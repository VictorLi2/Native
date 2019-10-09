struct Quiz: Codable {
    var id: String
    var title: String
    var numberOfQuestions: Int
    var content: [QuizQuestion]
}
