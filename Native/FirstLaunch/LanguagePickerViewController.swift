import UIKit

class LanguagePickerViewController: UIViewController {
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var instructionLabel: UILabel!
    
    var backgroundImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let title = NSMutableAttributedString(string: "What Language Are You Learning?", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30)])
        instructionLabel.attributedText = title
        
        view.addBackground(imageName: backgroundImage!)

        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let languageProficiencyViewController = segue.destination as! LanguageProficiencyViewController
        languageProficiencyViewController.oldBackgroundImage = backgroundImage
    }
    
    @IBAction func americanEnglish(_ sender: UIButton) {
        defaults.set("American English", forKey: "Language")
    }
    @IBAction func castilianSpanish(_ sender: UIButton) {
        defaults.set("Castilian Spanish", forKey: "Language")
    }
    @IBAction func latinAmericanSpanish(_ sender: UIButton) {
        defaults.set("Latin American Spanish", forKey: "Language")
    }
    @IBAction func french(_ sender: UIButton) {
        defaults.set("French", forKey: "Language")
    }
    @IBAction func mandarin(_ sender: UIButton) {
        defaults.set("Mandarin", forKey: "Language")
    }
    @IBAction func brazilianPortuguese(_ sender: UIButton) {
        defaults.set("Brazilian Portugese", forKey: "Language")
    }
    @IBAction func japanese(_ sender: UIButton) {
        defaults.set("Japanese", forKey: "Language")
    }
}
