import UIKit

class LanguageProficiencyViewController: UIViewController {
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var instructionLabel: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let title = NSMutableAttributedString(string: "Which Of These Best Describes You?", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30)])
        instructionLabel.attributedText = title
        
        let backgroundImage = ["Aït Benhaddou, Morocco", "Kyōto-shi, Japan", "Kyoto, Japan", "Los Glaciares National Park, Argentina", "Mutianyu Great Wall, China", "Paris, France", "Rio de Janeiro, Brazil"].randomElement()
        view.addBackground(imageName: backgroundImage!)
    }
    
    @IBAction func basicKnowledge(_ sender: UIButton) {
        defaults.set("Basic Knowledge", forKey: "Proficiency")
        defaults.set("true", forKey: "CompletedSetUp")
    }
    
    @IBAction func intermediateKnowledge(_ sender: UIButton) {
        defaults.set("Intermediate Knowledge", forKey: "Proficiency")
        defaults.set("true", forKey: "CompletedSetUp")
    }
    
    @IBAction func fluent(_ sender: UIButton) {
        defaults.set("Fluent", forKey: "Proficiency")
        defaults.set("true", forKey: "CompletedSetUp")
    }
}
