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
        
        guard let s2 = Song(title: "Stand By Me", artist: "Ben E. King", albumArt: UIImage(named: "Stand By Me")!) else {
            fatalError("Unable to instantiate s2")
        }
        
        guard let s3 = Song(title: "thank u, next", artist: "Ariana Grande", albumArt: UIImage(named: "thank u, next")!) else {
            fatalError("Unable to instantiate s3")
        }
        songs += [s1, s2, s3]
    }
}
