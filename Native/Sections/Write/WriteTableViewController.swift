import UIKit

class WriteTableViewController: UITableViewController {
    //MARK: Properties
    
    var writingLessons = [WritingLesson]()
    
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

        cell.writingLesson = writingLessons[indexPath.row]

        return cell
    }
    
    //MARK: Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ToWriteViewController") {
            let writeViewController = segue.destination as! WriteViewController
            if let cell = sender as? WriteTableViewCell, let indexPath = tableView.indexPath(for: cell) {
                writeViewController.writingLesson = writingLessons[indexPath.row]
            }
        }
    }

    //MARK: Private Methods
    private func loadWritingLessons() {
        guard let l1 = WritingLesson(title: "Lesson 1") else {
            fatalError("Unable to instantiate l1")
        }
        
        guard let l2 = WritingLesson(title: "Lesson 2") else {
            fatalError("Unable to instantiate l2")
        }
        
        guard let l3 = WritingLesson(title: "Lesson 3") else {
            fatalError("Unable to instantiate l3")
        }
        
        guard let l4 = WritingLesson(title: "Lesson 4") else {
            fatalError("Unable to instantiate l4")
        }
        
        writingLessons += [l1, l2, l3, l4]
    }
}
