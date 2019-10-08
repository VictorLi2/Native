import UIKit
import os.log
import WebKit

class YoutubeViewController: UIViewController {
    //MARK: Properties
    var youtubeVideo: YoutubeVideo?
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoChannelLabel: UILabel!
    @IBOutlet weak var videoDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(title: youtubeVideo!.title)
        
        videoTitleLabel.text = youtubeVideo?.title
        videoChannelLabel.text = youtubeVideo?.source
        videoDescriptionLabel.text = youtubeVideo?.description
        
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsInlineMediaPlayback = true
        webConfiguration.mediaTypesRequiringUserActionForPlayback = []
        
        let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: 375, height: 300), configuration: webConfiguration)
        webView.load("https://www.youtube.com/embed/\(youtubeVideo!.id)?playsinline=1")

        stackView.insertArrangedSubview(webView, at: 0)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        webView.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
        webView.heightAnchor.constraint(equalTo: webView.widthAnchor, multiplier: 211.0 / 375.0).isActive = true
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
