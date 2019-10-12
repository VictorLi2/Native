import UIKit
import AVKit
import AVFoundation

class AlphabetTrainerLetterViewController: UIViewController {
    var letter: String?
    
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar(title: "\(letter ?? "a")")
        
        setUpVideo()
    }
    
    private func setUpVideo() {
        guard let path = Bundle.main.path(forResource: "a", ofType:"mp4") else {
            debugPrint("video.m4v not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        playerController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 300)

        playerController.player!.play()
        stackView.addArrangedSubview(playerController.view)
        
        playerController.view.constraints
        
//        guard let path = Bundle.main.path(forResource: "a", ofType:"mp4") else {
//            debugPrint("video.m4v not found")
//            return
//        }
//        let player = AVPlayer(url: URL(fileURLWithPath: path))
//        let playerController = AVPlayerViewController()
//        playerController.player = player
//        present(playerController, animated: true) {
//            player.play()
//        }
    }
}
