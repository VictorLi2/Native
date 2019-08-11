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
        self.view.addSubview(webView)
        
        webView.load("https://www.youtube.com/embed/\(youtubeVideo!.id)?playsinline=1")
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
