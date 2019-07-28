import UIKit

class ReadTableViewController: UITableViewController {
    //MARK: Properties
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadSampleArticles()
        
        navigationController!.setNavigationBarHidden(false, animated: false)
        navigationItem.title = "Read"
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ToReadViewController") {
            let readViewController = segue.destination as! ReadViewController
            if let cell = sender as? ReadTableViewCell, let indexPath = tableView.indexPath(for: cell) {
                readViewController.article = articles[indexPath.row]
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    //MARK: Private Methods
    
    private func loadSampleArticles() {
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
