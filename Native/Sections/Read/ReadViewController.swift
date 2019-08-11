import UIKit

class ReadViewController: UIViewController {
    //MARK: Properties
    
    var article: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar(title: article!.title)

        let textView = UITextView()
        
        textView.text = article?.content
        //textView.isEditable = false
        
        textView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)

        textView.font = UIFont(name: textView.font!.fontName, size: 18)
        
        view.addSubview(textView)
    }
}
