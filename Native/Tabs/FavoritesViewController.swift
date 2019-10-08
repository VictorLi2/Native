import UIKit

class FavoritesViewController: UIViewController {

    let defaults = UserDefaults.standard
    var selected = "watchFavorites"
    var favorites = [YoutubeVideo]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(title: "Favorited")

        updateCells()
    }
    
    private func updateCells() {
//        favorites = [YoutubeVideo(id: "IevQx1zKNQs", title: "Top 10 Best Celebrity Bottle Cap Challenges"), YoutubeVideo(id: "UcxByX6rh24", title: "50 People Show Us Their States' Accents | Culturally Speaking | Condé Nast Traveler")] as! [YoutubeVideo]
    }
}

// MARK: - Table view
extension FavoritesViewController: UITableViewDataSource {
    func setupTableView() {
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellIdentifier: String
        
        switch selected {
        case "watchFavorites":
            cellIdentifier = "WatchTableViewCell"
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? YoutubeTableViewCell else {
                fatalError("The dequeued cell is not an instance of WatchTableViewCell.")
            }
            
            cell.youtubeVideo = favorites[indexPath.row] as? YoutubeVideo
            
            return cell
        case "readFavorites":
            cellIdentifier = "ReadTableViewCell"
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ReadTableViewCell  else {
                fatalError("The dequeued cell is not an instance of ReadTableViewCell.")
            }
            
            cell.article = favorites[indexPath.row] as? Article
            
            return cell
        case "listenFavorites":
            cellIdentifier = "ListenTableViewCell"
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ListenTableViewCell else {
                fatalError("The dequeued cell is not an instance of ListenTableViewCell.")
            }
            
            cell.song = favorites[indexPath.row] as? Song
            
            return cell
        case "writeFavorites":
            cellIdentifier = "WriteTableViewCell"
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? WriteTableViewCell else {
                fatalError("The dequeued cell is not an instance of WriteTableViewCell.")
            }
            
            cell.writingLesson = favorites[indexPath.row] as? WritingLesson
            
            return cell
        default:
            fatalError("False selection. Should never get here")
        }
    }
}
