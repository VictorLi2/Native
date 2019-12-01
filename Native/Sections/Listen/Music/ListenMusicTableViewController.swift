import UIKit

class ListenMusicTableViewController: UITableViewController {
    //MARK: Properties
    
    var songs = [Content]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(title: "Music")
    
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
        
        cell.song = songs[indexPath.row] as? Song
        
        return cell
    }

    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ToListenViewController") {
            let listenViewController = segue.destination as! ListenMusicViewController
            if let cell = sender as? ListenTableViewCell, let indexPath = tableView.indexPath(for: cell) {
                listenViewController.song = songs[indexPath.row] as? Song
            }
        }
    }

    //MARK: Private methods
    private func loadSongs() {
        let s1 = Song(title: "Someone You Loved", source: "Lewis Capaldi")
        
        let s2 = Song(title: "Circles", source: "Post Malone")
        
        let s3 = Song(title: "Senorita", source: "Shawn Mendes and Camila Cabello")
        
        let s4 = Song(title: "Good As Hell", source: "Lizzo")
        
        let s5 = Song(title: "Memories", source: "Maroon 5")
        
        let s6 = Song(title: "Truth Hurts", source: "Lizzo")
        
        let s7 = Song(title: "No Guidance", source: "Chris Brown Featuring Drake")
        
        let s8 = Song(title: "Hey Jude", source: "The Beatles")
        
        let s9 = Song(title: "Stand By Me", source: "Ben E. King")
        
        let s10 = Song(title: "thank u, next", source: "Ariana Grande")
        
        songs += [s1, s2, s3, s4, s5, s6, s7, s8, s9, s10]
    }
}

class ListenTableViewCell: UITableViewCell {
    //MARK: Properties
    var song: Song?
    
    @IBOutlet weak var albumArt: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var artist: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
   
        title.text = song?.title
        artist.text = song?.source
        albumArt.image = song?.image
    }
}
