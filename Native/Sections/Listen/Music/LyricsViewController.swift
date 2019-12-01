import UIKit

class LyricsViewController: UIViewController {

    var song: Song?
    
    @IBOutlet weak var TextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let filePath = Bundle.main.path(forResource: song?.title, ofType: "txt")
        var lyrics = ""
        
        do {
            lyrics = try String(contentsOfFile: filePath!, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed to read from file")
            print(error)
        }
        
        TextView.text = lyrics
    }
}
