import UIKit
import AVKit
import AVFoundation

class OrdinalNumbers4ViewController: UIViewController {

    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar(title: "Ordinal Numbers")
    }
    @IBAction func PressedAudio(_ sender: Any) {
        guard let url = Bundle.main.url(forResource: "fourth", withExtension: "mp3") else {
            debugPrint("fourth.mp3 not found")
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player!.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
