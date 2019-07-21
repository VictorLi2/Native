import UIKit
import FacebookLogin
import FBSDKLoginKit
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInUIDelegate, LoginButtonDelegate {
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var googleLoginButton: GIDSignInButton!
    @IBOutlet weak var appTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let title = NSMutableAttributedString(string: "Native", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 60)])
        title.append(NSMutableAttributedString(string: "\nA Language Learning App", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]))
        title.append(NSMutableAttributedString(string: "\n", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)]))
        appTitle.attributedText = title
        
        GIDSignIn.sharedInstance()?.uiDelegate = self
        GIDSignIn.sharedInstance().signInSilently()
        
        let facebookLoginButton = FacebookLoginButton(frame: CGRect(), permissions: [ .publicProfile ])
        stackView.insertArrangedSubview(facebookLoginButton, at: 0)
        facebookLoginButton.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(didSignIn), name: NSNotification.Name("SuccessfulGoogleSignInNotification"), object: nil)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        view.addBackground(imageName: getBackground())
    }
    
    private func getBackground() -> String {
        let language = UserDefaults.standard.object(forKey: "Language") as! String
        switch language {
        case "American English":
            return "Los Glaciares National Park, Argentina"
        default:
            return "Mutianyu Great Wall, China"
        }
        
        //TODO: Rest of backgrounds
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if((error) != nil) {
            // Process error
        } else if(result!.isCancelled) {
            // Handle cancellations
        } else {
            let mainTabController = storyboard!.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
            present(mainTabController, animated: true, completion: nil)
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
    }
    
    @objc func didSignIn()  {
        let mainTabController = storyboard!.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
        present(mainTabController, animated: true, completion: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
