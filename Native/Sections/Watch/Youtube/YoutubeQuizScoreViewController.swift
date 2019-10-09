import UIKit

class YoutubeQuizScoreViewController: UIViewController {

    var score: Int?
    var totalScore: Int?
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "\(score ?? 0)/\(totalScore ?? 0)"
    }
}
