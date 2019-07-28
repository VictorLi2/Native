import UIKit

class ListenTableViewController: UITableViewController {
    //MARK: Properties
    
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController!.setNavigationBarHidden(false, animated: false)
        navigationItem.title = "Listen"
        
        loadSongs()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }

    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

    //MARK: Private Methods
    private func loadSongs() {
        guard let s1 = Song(title: "a", artist: "b") else {
            fatalError("Unable to instantiate s1")
        }
        
        songs += []
    }
}
