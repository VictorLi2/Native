import UIKit

class YoutubeQuizViewController: UIViewController {

    var youtubeID: String?
    var currentQuestionNumber: Int?
    var quiz: Quiz!
    
    @IBOutlet weak var quizQuestionLabel: UILabel!
    @IBOutlet weak var answerOneLabel: UIButton!
    @IBOutlet weak var answerTwoLabel: UIButton!
    @IBOutlet weak var answerThreeLabel: UIButton!
    @IBOutlet weak var answerFourLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let decoder = JSONDecoder()
        
        do {
            let file = Bundle.main.url(forResource: youtubeID, withExtension: "json")
            let jsonData = try Data(contentsOf: file!)
            quiz = try decoder.decode(Quiz.self, from: jsonData)
        } catch {
            print(error.localizedDescription)
        }
        
        answerOneLabel.titleLabel?.minimumScaleFactor = 0.5
        answerOneLabel.titleLabel?.numberOfLines = 0
        answerOneLabel.titleLabel?.adjustsFontSizeToFitWidth = true
        
        answerTwoLabel.titleLabel?.minimumScaleFactor = 0.5
        answerTwoLabel.titleLabel?.numberOfLines = 0
        answerTwoLabel.titleLabel?.adjustsFontSizeToFitWidth = true
        
        answerThreeLabel.titleLabel?.minimumScaleFactor = 0.5
        answerThreeLabel.titleLabel?.numberOfLines = 0
        answerThreeLabel.titleLabel?.adjustsFontSizeToFitWidth = true
        
        answerFourLabel.titleLabel?.minimumScaleFactor = 0.5
        answerFourLabel.titleLabel?.numberOfLines = 0
        answerFourLabel.titleLabel?.adjustsFontSizeToFitWidth = true
        
        loadData()
    }
    
    private func loadData() {
        setupNavigationBar(title: "Question \(currentQuestionNumber! + 1)")
        let currentQuestion = quiz.content[currentQuestionNumber!]
        print(currentQuestion)
        quizQuestionLabel.text = currentQuestion.question
        answerOneLabel.setTitle(currentQuestion.answers[0], for: .normal)
        answerTwoLabel.setTitle(currentQuestion.answers[1], for: .normal)
        answerThreeLabel.setTitle(currentQuestion.answers[2], for: .normal)
        answerFourLabel.setTitle(currentQuestion.answers[3], for: .normal)
    }
    
    @IBAction func nextQuestionButton(_ sender: Any) {
        currentQuestionNumber! += 1
        loadData()
    }
}
