import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController!.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func profile(_ sender: UIButton) {
        tabBarController!.selectedIndex = 2
    }
}
