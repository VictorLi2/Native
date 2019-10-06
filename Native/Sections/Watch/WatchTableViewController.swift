import UIKit

class WatchTableViewController: UITableViewController {
    //MARK: Properties
    
    var youtubeVideos = [Content]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(title: "Youtube")
        
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
        
        cell.youtubeVideo = youtubeVideos[indexPath.row] as? YoutubeVideo

        return cell
    }

    //MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ToWatchViewController") {
            let watchViewController = segue.destination as! WatchViewController
            if let cell = sender as? WatchTableViewCell, let indexPath = tableView.indexPath(for: cell) {
                watchViewController.youtubeVideo = youtubeVideos[indexPath.row] as? YoutubeVideo
            }
        }
    }
    
    //MARK: Private methods
    private func loadYoutubeVideos() {
        
        let video1 = YoutubeVideo(id: "IevQx1zKNQs", title: "Top 10 Best Celebrity Bottle Cap Challenges", source: "WatchMojo.com")
        
        let video2 = YoutubeVideo(id: "UcxByX6rh24", title: "50 People Show Us Their States' Accents | Culturally Speaking | Condé Nast Traveler", source: "Condé Nast Traveler")
        
        let video3 = YoutubeVideo(id: "_99ySDoC1fw", title: "Blind Devotion | Jubilee Media Short Film", source: "Jubilee")
        
        let video4 = YoutubeVideo(id: "KONe4SNFA64", title: "Rihanna's Epic 10-Minute Guide to Going Out Makeup | Beauty Secrets | Vogue", source: "Vogue")
        
        let video5 = YoutubeVideo(id: "AFxCO_DyzYM", title: "Bruno Mars Carpool Karaoke", source: "The Late Late Show with James Corden")
        
        let video6 = YoutubeVideo(id: "f_WaxuN4o78", title: "Confessions of a Disney Employee", source: "sWooZie")
        
        let video7 = YoutubeVideo(id: "TB0522Zzrw8", title: "Kawhi Leonard Laughing Compilation", source: "The Sixth Man")
        
        let video8 = YoutubeVideo(id: "3sABZy7OwRI", title: "Do All Muslims Think The Same?", source: "Jubilee")
        
        let video9 = YoutubeVideo(id: "KM4Xe6Dlp0Y", title: "Looks aren't everything. Believe me, I'm a model. | Cameron Russell", source: "TED")
        
        let video10 = YoutubeVideo(id: "Cm0MGnuRnH0", title: "Billie Eilish: Same Interview, One Year Apart | Vanity Fair", source: "Vanity Fair")
        
        youtubeVideos += [video1, video2, video3, video4, video5, video6, video7, video8, video9, video10]
    }
}

class WatchTableViewCell: UITableViewCell {
    //MARK: Properties
    
    var youtubeVideo: YoutubeVideo?
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        thumbnail.image = youtubeVideo?.image
        title.text = youtubeVideo?.title
    }
}

