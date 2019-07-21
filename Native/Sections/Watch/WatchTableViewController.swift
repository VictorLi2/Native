import UIKit

class WatchTableViewController: UITableViewController {
    //MARK: Properties
    
    var youtubeVideos = [YoutubeVideo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController!.setNavigationBarHidden(false, animated: false)
        
        loadYoutubeVideos()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        
        let youtubeVideo = youtubeVideos[indexPath.row]
        cell.thumbnail.image = youtubeVideo.thumbnail
        cell.title.text = youtubeVideo.title

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ToWatchViewController") {
            let watchViewController = segue.destination as! WatchViewController
            if let cell = sender as? WatchTableViewCell, let indexPath = tableView.indexPath(for: cell) {
                watchViewController.youtubeVideo = youtubeVideos[indexPath.row]
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
