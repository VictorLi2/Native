import UIKit

class YoutubeQuizViewController: UIViewController {

    var youtubeID: String?
    var currentQuestionNumber: Int?
    var quiz: Quiz!
    var selectedButtons: [Int]!
    
    @IBOutlet weak var quizQuestionLabel: UILabel!
    @IBOutlet weak var answerOneButton: UIButton!
    @IBOutlet weak var answerTwoButton: UIButton!
    @IBOutlet weak var answerThreeButton: UIButton!
    @IBOutlet weak var answerFourButton: UIButton!
    @IBOutlet weak var previousQuestionButton: UIButton!
    @IBOutlet weak var nextQuestionButton: UIButton!
    
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
        
        selectedButtons = [Int](repeating: 0, count: quiz.numberOfQuestions)
        loadData()
    }
    
    private func loadData() {
        if(currentQuestionNumber == 0) {
            previousQuestionButton.isHidden = true
        } else {
            previousQuestionButton.isHidden = false
        }
        
        if(currentQuestionNumber == quiz.numberOfQuestions - 1) {
            nextQuestionButton.setTitle("Finish Quiz", for: .normal)
        } else {
            nextQuestionButton.setTitle("Next Question", for: .normal)
        }
        
        setupNavigationBar(title: "Question \(currentQuestionNumber! + 1)")
        let currentQuestion = quiz.content[currentQuestionNumber!]

        quizQuestionLabel.text = currentQuestion.question
        answerOneButton.setTitle(currentQuestion.answers[0], for: .normal)
        answerTwoButton.setTitle(currentQuestion.answers[1], for: .normal)
        answerThreeButton.setTitle(currentQuestion.answers[2], for: .normal)
        answerFourButton.setTitle(currentQuestion.answers[3], for: .normal)
    }
    
    private func calculateScore() -> Int {
        var score = 0
        for (index, selectedButton) in selectedButtons.enumerated() {
            if(selectedButton == quiz.content[index].rightAnswer) {
                score += 1
            }
        }
        return score
    }
    
    private func selectButton(buttonNumber: Int) {
        selectedButtons[currentQuestionNumber!] = buttonNumber
        
        switch(buttonNumber) {
        case 0:
            break
        case 1:
            answerOneButton.backgroundColor = .lightGray
        case 2:
            answerTwoButton.backgroundColor = .lightGray
        case 3:
            answerThreeButton.backgroundColor = .lightGray
        case 4:
            answerFourButton.backgroundColor = .lightGray
        default:
            print("shouldn't get here since there is only 4 buttons")
        }
    }
    
    private func deselectButton(buttonNumber: Int) {
        switch(buttonNumber) {
        case 0:
            break
        case 1:
            answerOneButton.backgroundColor = .none
        case 2:
            answerTwoButton.backgroundColor = .none
        case 3:
            answerThreeButton.backgroundColor = .none
        case 4:
            answerFourButton.backgroundColor = .none
        default:
            print("shouldn't get here since there is only 4 buttons")
        }
    }
    
    private func answerButtonSelectionHandler(buttonNumber: Int) {
        switch(selectedButtons[currentQuestionNumber!]) {
        case 0:
            selectButton(buttonNumber: buttonNumber)
            
            if(currentQuestionNumber! == quiz.numberOfQuestions - 1) {
                nextQuestionButton.backgroundColor = .systemGreen
            }
        case buttonNumber:
            selectedButtons[currentQuestionNumber!] = 0
            deselectButton(buttonNumber: buttonNumber)
            
            if(currentQuestionNumber! == quiz.numberOfQuestions - 1) {
                nextQuestionButton.backgroundColor = .none
            }
        default:
            deselectButton(buttonNumber: selectedButtons[currentQuestionNumber!])
            selectButton(buttonNumber: buttonNumber)
        }
        
        if(currentQuestionNumber! < quiz.numberOfQuestions - 1) {
            deselectButton(buttonNumber: selectedButtons[currentQuestionNumber!])
            currentQuestionNumber! += 1
            selectButton(buttonNumber: selectedButtons[currentQuestionNumber!])
            loadData()
        }
    }
    
    @IBAction func answerOneButton(_ sender: Any) {
        answerButtonSelectionHandler(buttonNumber: 1)
    }
    
    @IBAction func answerTwoButton(_ sender: Any) {
        answerButtonSelectionHandler(buttonNumber: 2)
    }
    
    @IBAction func answerThreeButton(_ sender: Any) {
        answerButtonSelectionHandler(buttonNumber: 3)
    }
    
    @IBAction func answerFourButton(_ sender: Any) {
        answerButtonSelectionHandler(buttonNumber: 4)
    }
    
    @IBAction func previousQuestionButton(_ sender: Any) {
        if(currentQuestionNumber! == quiz.numberOfQuestions - 1) {
                 nextQuestionButton.backgroundColor = .none
        }
        
        deselectButton(buttonNumber: selectedButtons[currentQuestionNumber!])
        currentQuestionNumber! -= 1
        selectButton(buttonNumber: selectedButtons[currentQuestionNumber!])
        
        loadData()
    }
    
    @IBAction func nextQuestionButton(_ sender: Any) {
        if(currentQuestionNumber == quiz.numberOfQuestions - 1) {
            let youtubeQuizScoreViewController = storyboard?.instantiateViewController(withIdentifier: "YoutubeQuizScoreViewController") as! YoutubeQuizScoreViewController
            youtubeQuizScoreViewController.score = calculateScore()
            youtubeQuizScoreViewController.totalScore = quiz.numberOfQuestions
            present(youtubeQuizScoreViewController, animated: true, completion: nil)
        } else {
            deselectButton(buttonNumber: selectedButtons[currentQuestionNumber!])
            currentQuestionNumber! += 1
            selectButton(buttonNumber: selectedButtons[currentQuestionNumber!])
            
            if((currentQuestionNumber! == quiz.numberOfQuestions - 1) && selectedButtons[currentQuestionNumber!] != 0) {
                     nextQuestionButton.backgroundColor = .systemGreen
            }
            
            loadData()
        }
    }
}
