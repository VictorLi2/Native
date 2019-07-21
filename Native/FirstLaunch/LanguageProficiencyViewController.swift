import UIKit

class LanguageProficiencyViewController: UIViewController {
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var instructionLabel: UILabel!
    
    var oldBackgroundImage: String?
    var backgroundImage: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let title = NSMutableAttributedString(string: "Which Of These Best Describes You?", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30)])
        instructionLabel.attributedText = title
        
        if(backgroundImage == nil) {
            let backgroundImages = ["Aït Benhaddou, Morocco", "Kyōto-shi, Japan", "Kyoto, Japan", "Los Glaciares National Park, Argentina", "Mutianyu Great Wall, China", "Paris, France", "Rio de Janeiro, Brazil"].filter {$0 != oldBackgroundImage}
            let backgroundImage = backgroundImages.randomElement()
            view.addBackground(imageName: backgroundImage!!)
        } else {
            view.addBackground(imageName: backgroundImage!)
        }
    }
    
    @IBAction func firstTimeLearner(_ sender: UIButton) {
        defaults.set("First Time Learner", forKey: "Proficiency")
        defaults.set("true", forKey: "CompletedSetUp")
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
