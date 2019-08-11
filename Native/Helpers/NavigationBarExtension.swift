import UIKit

extension UIViewController {
    func setupNavigationBar(title: String) {
        navigationItem.title = title
        
        let button: UIButton = UIButton(type: .custom)
        button.setImage(UIImage(named: "Translate"), for: .normal)
        button.addTarget(self, action: #selector(translateButtonPressed), for: .touchUpInside)
        
        navigationItem.setRightBarButton(UIBarButtonItem(customView: button), animated: true)
    }
    
    @objc func translateButtonPressed(sender: UIButton) {
        let translateViewController = storyboard!.instantiateViewController(withIdentifier: "TranslateViewController") as! TranslateViewController
        navigationController!.pushViewController(translateViewController, animated: true)
    }
}
