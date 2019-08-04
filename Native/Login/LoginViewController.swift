import UIKit
import FacebookLogin
import FBSDKLoginKit
import GoogleSignIn

// TODO: Redo Title maybe after we have a Logo?

class LoginViewController: UIViewController, GIDSignInUIDelegate, LoginButtonDelegate {
    
    // MARK: Outlets
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var googleLoginButton: GIDSignInButton!
    @IBOutlet weak var appTitle: UILabel!
    
    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        setupGoogleSignin()
        setupFacebookSignin()
        
        view.addBackground(imageName: getBackground())
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    deinit {
        loginDeinit()
    }
    
    // MARK: Private Methods
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
}

// MARK: - Display related
extension LoginViewController {
    func setupTitle() {
        let title = NSMutableAttributedString(string: "Native", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 60)])
        title.append(NSMutableAttributedString(string: "\nA Language Learning App", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]))
        title.append(NSMutableAttributedString(string: "\n", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)]))
        appTitle.attributedText = title
    }
}

// MARK: - Login button functions
extension LoginViewController {
    func setupGoogleSignin() {
        GIDSignIn.sharedInstance()?.uiDelegate = self
        GIDSignIn.sharedInstance().signInSilently()
        
        NotificationCenter.default.addObserver(self, selector: #selector(didSignIn), name: NSNotification.Name("SuccessfulGoogleSignInNotification"), object: nil)
    }
    
    func setupFacebookSignin() {
        let facebookLoginButton = FacebookLoginButton(frame: CGRect(), permissions: [ .publicProfile ])
        stackView.insertArrangedSubview(facebookLoginButton, at: 0)
        facebookLoginButton.delegate = self
    }
    
    // Facebook login button
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
    
    // Facebook logout button
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
    }
    
    // on Google Signin
    @objc func didSignIn()  {
        let mainTabController = storyboard!.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
        present(mainTabController, animated: true, completion: nil)
    }
    
    //
    func loginDeinit() {
        NotificationCenter.default.removeObserver(self)
    }
}
