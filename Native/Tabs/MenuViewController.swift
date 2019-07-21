import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController!.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func profile(_ sender: UIButton) {
        tabBarController!.selectedIndex = 2
    }
}
