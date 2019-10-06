import UIKit
import os.log
import WebKit

class WatchViewController: UIViewController {
    //MARK: Properties
    var youtubeVideo: YoutubeVideo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(title: youtubeVideo!.title)
        
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsInlineMediaPlayback = true
        webConfiguration.mediaTypesRequiringUserActionForPlayback = []
        
        let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: 375, height: 300), configuration: webConfiguration)
        //self.view.addSubview(webView)
        
        webView.load("https://www.youtube.com/embed/\(youtubeVideo!.id)?playsinline=1")
        
        if(youtubeVideo?.id == "Cm0MGnuRnH0") {
            var quizQuestions = [QuizQuestion]()
            
            let question1 = QuizQuestion(question: "When was this video recorded?", rightAnswer: 4, answers: ["September 2017 and September 2018", "May 2016 and June 2018", "April 2016 and June 2011", "October 2017 and October 2018"], timeInVideo: 6)
            
             let question2 = QuizQuestion(question: "How old is Billie Eilish in the video?", rightAnswer: 1, answers: ["15 and 16 years old", "14 and 15 years old", "15 and 17 years old", "15 and 11 years old"], timeInVideo: 11)
            
            let question3 = QuizQuestion(question: "In 2017, Billie Eilish had __ Instagram followers.", rightAnswer: 2, answers: ["250,057", "257,000", "54,000", "1.4M"], timeInVideo: 14)
            
            quizQuestions += [question1, question2, question3]
            
            let quiz = Quiz(quizType: .watch, id: "Cm0MGnuRnH0", title: "Billie Eilish Quiz", content: quizQuestions)
        }
        
        
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        
        stackView.addArrangedSubview(webView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(stackView)
    }
}

extension WKWebView {
    func load(_ urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            load(request)
        }
    }
}
