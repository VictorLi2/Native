struct Quiz: Codable {
    var id: String
    var title: String
    var content: [QuizQuestion]
}
