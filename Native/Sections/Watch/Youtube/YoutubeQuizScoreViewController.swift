import UIKit
import AVFoundation

class YoutubeQuizScoreViewController: UIViewController {

    var score: Int?
    var totalScore: Int?
    
    var player: AVAudioPlayer?
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = "\(score!)/\(totalScore!)"
        
        if(score! == totalScore!) {
            playSound(soundName: "PerfectScore")
            commentLabel.text = "Congratulations!\nA Perfect Score!\n+100xp"
        } else if(score! < (totalScore! * 8 / 10)) {
            playSound(soundName: "BadScore")
            commentLabel.text = "Nice Try\nYou can do better!\n+10xp"
        } else {
            playSound(soundName: "GoodScore")
            commentLabel.text = "Good Job!\nSo Close to Perfect!\n+50xp"
        }
    }

    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")

        do {
            player = try AVAudioPlayer(contentsOf: url!)
            player!.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
