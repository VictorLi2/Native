import UIKit

class EnglishCountriesViewController: UIViewController {

    @IBOutlet weak var instructionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let title = NSMutableAttributedString(string: "Which country would you like to focus on?", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30)])
               instructionLabel.attributedText = title
        
        let backgroundImage = ["Aït Benhaddou, Morocco", "Kyōto-shi, Japan", "Kyoto, Japan", "Los Glaciares National Park, Argentina", "Mutianyu Great Wall, China", "Paris, France", "Rio de Janeiro, Brazil"].randomElement()
        view.addBackground(imageName: backgroundImage!)
    }
}
