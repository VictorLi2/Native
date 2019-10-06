import UIKit

class WriteTableViewController: UITableViewController {
    //MARK: Properties
    var writingLessons = [Content]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(title: "Write")
        
        loadWritingLessons()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return writingLessons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "WriteTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? WriteTableViewCell else {
            fatalError("The dequeued cell is not an instance of WriteTableViewCell.")
        }

        cell.writingLesson = writingLessons[indexPath.row] as? WritingLesson

        return cell
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ToWriteViewController") {
            let writeViewController = segue.destination as! WriteViewController
            if let cell = sender as? WriteTableViewCell, let indexPath = tableView.indexPath(for: cell) {
                writeViewController.writingLesson = writingLessons[indexPath.row] as? WritingLesson
            }
        }
    }

    //MARK: Private methods
    private func loadWritingLessons() {
        let l1 = WritingLesson(title: "Lesson 1", source: "source 1", image: UIImage(named: "Write")!)
        
        let l2 = WritingLesson(title: "Lesson 2", source: "source 2", image: UIImage(named: "Write")!)
        
        let l3 = WritingLesson(title: "Lesson 3", source: "source 3", image: UIImage(named: "Write")!)
        
        writingLessons += [l1, l2, l3]
    }
}

class WriteTableViewCell: UITableViewCell {
    //MARK: Properties
    
    var writingLesson: WritingLesson?
    
    @IBOutlet weak var title: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        title.text = writingLesson?.title
    }
}
