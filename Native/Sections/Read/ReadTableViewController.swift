import UIKit

class ReadTableViewController: UITableViewController {
    //MARK: Properties
    
    var articles = [Content]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(title: "Read")
        
        loadArticles()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ReadTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ReadTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ReadTableViewCell.")
        }
        
        cell.article = articles[indexPath.row] as? Article
        return cell
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ToReadViewController") {
            let readViewController = segue.destination as! ReadViewController
            if let cell = sender as? ReadTableViewCell, let indexPath = tableView.indexPath(for: cell) {
                readViewController.article = articles[indexPath.row] as? Article
            }
        }
    }

    //MARK: Private methods
    private func loadArticles() {
        let a1 = Article(id: "Kawhi", title: "Kawhi Leonard and Paul George officially join Los Angeles Clippers", source: "The Guardian")
        
        let a2 = Article(id: "FacebookLibra", title: "Facebook announces Libra cryptocurrency: All you need to know", source: "Tech Crunch")
        
        let a3 = Article(id: "TaylorSwift", title: "Taylor Swift tops Forbes list of highest-earning celebs", source: "BBC")
        
        
        articles += [a1, a2, a3]
    }
}

class ReadTableViewCell: UITableViewCell {
    //MARK: Properties
    var article: Article?
    
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var source: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        articleImage.image = article?.image
        title.text = article?.title
        source.text = article?.source
    }
}
