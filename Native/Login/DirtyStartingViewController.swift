import UIKit
import FBSDKLoginKit
import GoogleSignIn

class DirtyStartingViewController: UIViewController {
    let defaults = UserDefaults.standard
    
    let firstLaunch = FirstLaunch(userDefaults: .standard, key: "com.mycompany.FirstLaunch.WasLaunchedBefore")
    let alwaysFirstLaunch = FirstLaunch.alwaysFirst()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if(firstLaunch.isFirstLaunch || defaults.object(forKey: "CompletedSetUp") as? String == "false") {
            let firstLaunchViewContoller = storyboard!.instantiateViewController(withIdentifier: "FirstLaunchViewController") as! FirstLaunchViewController
            present(firstLaunchViewContoller, animated: true, completion: nil)
        } else {
            if(AccessToken.isCurrentAccessTokenActive || GIDSignIn.sharedInstance()!.hasAuthInKeychain()) {
                let mainTabController = storyboard!.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
                present(mainTabController, animated: true, completion: nil)
            } else {
                let loginViewController = storyboard!.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                present(loginViewController, animated: true, completion: nil)
            }
        }
    }
}
