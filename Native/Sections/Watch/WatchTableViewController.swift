import UIKit

class WatchTableViewController: UITableViewController {
    //MARK: Properties
    
    var youtubeVideos = [YoutubeVideo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController!.setNavigationBarHidden(false, animated: false)
        navigationItem.title = "Watch"
        
        loadYoutubeVideos()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return youtubeVideos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "WatchTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? WatchTableViewCell else {
            fatalError("The dequeued cell is not an instance of WatchTableViewCell.")
        }
        
        cell.youtubeVideo = youtubeVideos[indexPath.row]

        return cell
    }

    //MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ToWatchViewController") {
            let watchViewController = segue.destination as! WatchViewController
            if let cell = sender as? WatchTableViewCell, let indexPath = tableView.indexPath(for: cell) {
                watchViewController.youtubeVideo = youtubeVideos[indexPath.row]
            }
        }
    }
    
    //MARK: Private Methods
    
    private func loadYoutubeVideos() {
        
        guard let video1 = YoutubeVideo(id: "IevQx1zKNQs", title: "Top 10 Best Celebrity Bottle Cap Challenges") else {
            fatalError("Unable to instantiate video1")
        }
        
        guard let video2 = YoutubeVideo(id: "UcxByX6rh24", title: "50 People Show Us Their States' Accents | Culturally Speaking | Condé Nast Traveler") else {
            fatalError("Unable to instantiate video2")
        }
        
        guard let video3 = YoutubeVideo(id: "_99ySDoC1fw", title: "Blind Devotion | Jubilee Media Short Film") else {
            fatalError("Unable to instantiate video3")
        }
        
        guard let video4 = YoutubeVideo(id: "KONe4SNFA64", title: "Rihanna's Epic 10-Minute Guide to Going Out Makeup | Beauty Secrets | Vogue") else {
            fatalError("Unable to instantiate video4")
        }
        
        guard let video5 = YoutubeVideo(id: "AFxCO_DyzYM", title: "Bruno Mars Carpool Karaoke") else {
            fatalError("Unable to instantiate video5")
        }
        
        guard let video6 = YoutubeVideo(id: "f_WaxuN4o78", title: "Confessions of a Disney Employee") else {
            fatalError("Unable to instantiate video6")
        }
        
        guard let video7 = YoutubeVideo(id: "TB0522Zzrw8", title: "Kawhi Leonard Laughing Compilation") else {
            fatalError("Unable to instantiate video7")
        }
        
        guard let video8 = YoutubeVideo(id: "3sABZy7OwRI", title: "Do All Muslims Think The Same?") else {
            fatalError("Unable to instantiate video8")
        }
        
        guard let video9 = YoutubeVideo(id: "KM4Xe6Dlp0Y", title: "Looks aren't everything. Believe me, I'm a model. | Cameron Russell") else {
            fatalError("Unable to instantiate video9")
        }
        
        youtubeVideos += [video1, video2, video3, video4, video5, video6, video7, video8, video9]
    }
}
