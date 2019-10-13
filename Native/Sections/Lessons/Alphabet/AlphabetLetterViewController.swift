import UIKit
import AVKit
import AVFoundation

class AlphabetLetterViewController: UIViewController {
    var letter: String?
    var player: AVAudioPlayer?

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var letterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popUpView.layer.cornerRadius = 5
        popUpView.layer.borderWidth = 1
        popUpView.layer.borderColor = UIColor.black.cgColor
        
        letterLabel.text = letter
    }
    
    @IBAction func pressedPlayAudio(_ sender: Any) {
        guard let url = Bundle.main.url(forResource: letter?.lowercased(), withExtension: "mp3") else {
            debugPrint("\(letter!).mp3 not found")
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player!.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func pressedPlayVideo(_ sender: Any) {
        guard let url = Bundle.main.url(forResource: letter?.lowercased(), withExtension: "mp4") else {
            debugPrint("\(letter!).mp4 not found")
            return
        }
        let player = AVPlayer(url: url)
        let playerController = AVPlayerViewController()
        playerController.player = player
        
        present(playerController, animated: true) {
            player.play()
        }
    }
    
    @IBAction func closePopUp(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
