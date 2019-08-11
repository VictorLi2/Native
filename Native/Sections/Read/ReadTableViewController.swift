import UIKit

class ReadTableViewController: UITableViewController {
    //MARK: Properties
    
    var articles = [Article]()
    
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
        
        cell.article = articles[indexPath.row]
        return cell
    }
    
    //MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ToReadViewController") {
            let readViewController = segue.destination as! ReadViewController
            if let cell = sender as? ReadTableViewCell, let indexPath = tableView.indexPath(for: cell) {
                readViewController.article = articles[indexPath.row]
            }
        }
    }

    //MARK: Private Methods
    
    private func loadArticles() {
        guard let a1 = Article(title: "Kawhi Leonard and Paul George officially join Los Angeles Clippers", source: "The Guardian", image: UIImage(named: "Kawhi")!, content: getArticleContent(fileName: "Kawhi")) else {
            fatalError("Unable to instantiate a1")
        }
        
        guard let a2 = Article(title: "Facebook announces Libra cryptocurrency: All you need to know", source: "Tech Crunch", image: UIImage(named: "FacebookLibra")!, content: getArticleContent(fileName: "FacebookLibra")) else {
            fatalError("Unable to instantiate a2")
        }
        
        guard let a3 = Article(title: "Taylor Swift tops Forbes list of highest-earning celebs", source: "BBC", image: UIImage(named: "TaylorSwift")!, content: getArticleContent(fileName: "TaylorSwift")) else {
            fatalError("Unable to instantiate a3")
        }
        
        articles += [a1, a2, a3]
    }
    
    private func getArticleContent(fileName: String) -> String {
        let filePath = Bundle.main.path(forResource: fileName, ofType: "txt")
        var content = ""
        
        do {
            content = try String(contentsOfFile: filePath!, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed to read from file")
            print(error)
        }
        
        return content
    }
}
