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
        let cellIdentifier = "ListenTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ListenTableViewCell else {
            fatalError("The dequeued cell is not an instance of ListenTableViewCell.")
        }
        
        cell.song = songs[indexPath.row]
        
        return cell
    }

    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ToListenViewController") {
            let listenViewController = segue.destination as! ListenViewController
            if let cell = sender as? ListenTableViewCell, let indexPath = tableView.indexPath(for: cell) {
                listenViewController.song = songs[indexPath.row]
            }
        }
    }

    //MARK: Private Methods
    private func loadSongs() {
        guard let s1 = Song(title: "Hey Jude", artist: "The Beatles", albumArt: UIImage(named: "Hey Jude")!) else {
            fatalError("Unable to instantiate s1")
        }
        
        songs += [s1]
    }
}
