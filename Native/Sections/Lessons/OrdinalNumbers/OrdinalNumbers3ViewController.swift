import UIKit
import AVKit
import AVFoundation

class OrdinalNumbers3ViewController: UIViewController {

    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar(title: "Ordinal Numbers")
    }
    
    @IBAction func PressedAudio(_ sender: Any) {
        guard let url = Bundle.main.url(forResource: "third", withExtension: "mp3") else {
            debugPrint("third.mp3 not found")
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
