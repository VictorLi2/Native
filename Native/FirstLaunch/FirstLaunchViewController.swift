import UIKit

class FirstLaunchViewController: UIViewController {
    //MARK: Properties
    let defaults = UserDefaults.standard
    @IBOutlet weak var appTitle: UILabel!
    @IBOutlet weak var getStartedButton: UIButton!
    
    var backgroundImage = ["Aït Benhaddou, Morocco", "Kyōto-shi, Japan", "Kyoto, Japan", "Los Glaciares National Park, Argentina", "Mutianyu Great Wall, China", "Paris, France", "Rio de Janeiro, Brazil"].randomElement()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaults.set("false", forKey: "CompletedSetUp")
        
        let title = NSMutableAttributedString(string: "Native", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 60)])
        title.append(NSMutableAttributedString(string: "\nA Language Learning App", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]))
        title.append(NSMutableAttributedString(string: "\n", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)]))
        appTitle.attributedText = title

        getStartedButton.contentEdgeInsets = UIEdgeInsets(top: 20, left: 30, bottom: 20, right: 30)

        view.addBackground(imageName: backgroundImage!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let languagePickerViewController = navigationController.viewControllers.first as! LanguagePickerViewController
        languagePickerViewController.backgroundImage = backgroundImage
    }
}
