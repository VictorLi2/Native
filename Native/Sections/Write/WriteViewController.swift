import UIKit

class WriteViewController: UIViewController {
    //MARK: Properties
    var writingLesson: WritingLesson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController!.setNavigationBarHidden(false, animated: false)
        
        let textView = UITextView()
        
        textView.text = "a"
        
        textView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        textView.font = UIFont(name: textView.font!.fontName, size: 18)
        
        view.addSubview(textView)
    }
}
