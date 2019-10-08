import UIKit

extension UIViewController {
    func setupNavigationBar(title: String) {
        navigationItem.title = title
        
        let button: UIButton = UIButton(type: .custom)
        button.setImage(UIImage(named: "Translate"), for: .normal)
        button.addTarget(self, action: #selector(translateButtonPressed), for: .touchUpInside)
        
        navigationItem.setRightBarButton(UIBarButtonItem(customView: button), animated: true)
        
        // Change colours of the nav bar and tab bar
        //let colour = "036ffc"
        //navigationController?.navigationBar.barTintColor = ColourHelper.hexStringToUIColour(hex: colour)
        //tabBarController?.tabBar.barTintColor = ColourHelper.hexStringToUIColour(hex: colour)
    }
    
    @objc func translateButtonPressed(sender: UIButton) {
        let translateViewController = storyboard!.instantiateViewController(withIdentifier: "TranslateViewController") as! TranslateViewController
        navigationController!.pushViewController(translateViewController, animated: true)
    }
}
