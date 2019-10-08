import UIKit

class HomeTableViewController: UITableViewController {
    var contentCollections = [ContentCollection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(title: "Home")
        
        loadContentCollections()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentCollections.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableCell", for: indexPath) as! HomeTableCell
        cell.cellTitleLabel.text = contentCollections[indexPath.row].title

        if cell.collectionController == nil {
            let collectionController = storyboard?.instantiateViewController(withIdentifier: "HomeCollectionViewController") as! HomeCollectionViewController
            collectionController.delegate = self
            collectionController.contentArray = contentCollections[indexPath.row].contentArray
            cell.delegate = self
            cell.collectionController = collectionController
            let collectionControllerView = collectionController.view!
            collectionControllerView.translatesAutoresizingMaskIntoConstraints = false
            cell.columnStack.addArrangedSubview(collectionController.view)
            let layout = collectionController.collectionViewLayout as! UICollectionViewFlowLayout
            NSLayoutConstraint.activate([
                collectionControllerView.widthAnchor.constraint(equalTo: cell.columnStack.widthAnchor),
                collectionControllerView.heightAnchor.constraint(equalToConstant: layout.itemSize.height),
                ])
        }

        return cell
    }
    
    // MARK: Private methods
    private func loadContentCollections() {
        let cc1 = ContentCollection(title: "Recommended for you", contentArray: [Article(id: "Kawhi", title: "Kawhi Leonard and Paul George officially join Los Angeles Clippers", source: "The Guardian"), YoutubeVideo(id: "IevQx1zKNQs", title: "Top 10 Best Celebrity Bottle Cap Challenges", source: "WatchMojo.com", description: "This viral internet challenge shows no sign of slowing down! The bottle cap challenge is sweeping the internet and now tons of celebs are taking part. We’re looking at the most epic celebrity bottle cap challenges from people like Jason Statham, John Mayer and Conor McGregor. Join WatchMojo as we count down our picks for the most memorable celebs who have done the bottle cap challenge. Who do YOU think really nailed the challenge? Let us know in the comments!"), Song(title: "Hey Jude", source: "The Beatles"), Article(id: "FacebookLibra", title: "Facebook announces Libra cryptocurrency: All you need to know", source: "Tech Crunch"), YoutubeVideo(id: "UcxByX6rh24", title: "50 People Show Us Their States' Accents | Culturally Speaking | Condé Nast Traveler", source: "Condé Nast Traveler", description: "In this episode of 'Culturally Speaking,' 50 people from the 50 United States of America attempt to demonstrate the accent from their home state. Does your state have an accent? Do you accent your \"r's\" or do you let them hang? Can you really tell where someone is from based on their accent? Find out!"), Song(title: "Stand By Me", source: "Ben E. King")])
        let cc2 = ContentCollection(title: "Trending", contentArray: [YoutubeVideo(id: "IevQx1zKNQs", title: "Top 10 Best Celebrity Bottle Cap Challenges", source: "WatchMojo.com", description: "This viral internet challenge shows no sign of slowing down! The bottle cap challenge is sweeping the internet and now tons of celebs are taking part. We’re looking at the most epic celebrity bottle cap challenges from people like Jason Statham, John Mayer and Conor McGregor. Join WatchMojo as we count down our picks for the most memorable celebs who have done the bottle cap challenge. Who do YOU think really nailed the challenge? Let us know in the comments!"), Song(title: "Hey Jude", source: "The Beatles"), Article(id: "FacebookLibra", title: "Facebook announces Libra cryptocurrency: All you need to know", source: "Tech Crunch"), YoutubeVideo(id: "UcxByX6rh24", title: "50 People Show Us Their States' Accents | Culturally Speaking | Condé Nast Traveler", source: "Condé Nast Traveler", description: "In this episode of 'Culturally Speaking,' 50 people from the 50 United States of America attempt to demonstrate the accent from their home state. Does your state have an accent? Do you accent your \"r's\" or do you let them hang? Can you really tell where someone is from based on their accent? Find out!"), Song(title: "Stand By Me", source: "Ben E. King"), Article(id: "Kawhi", title: "Kawhi Leonard and Paul George officially join Los Angeles Clippers", source: "The Guardian")])
        let cc3 = ContentCollection(title: "New", contentArray: [Song(title: "Hey Jude", source: "The Beatles"), Article(id: "FacebookLibra", title: "Facebook announces Libra cryptocurrency: All you need to know", source: "Tech Crunch"), YoutubeVideo(id: "UcxByX6rh24", title: "50 People Show Us Their States' Accents | Culturally Speaking | Condé Nast Traveler", source: "Condé Nast Traveler", description: "In this episode of 'Culturally Speaking,' 50 people from the 50 United States of America attempt to demonstrate the accent from their home state. Does your state have an accent? Do you accent your \"r's\" or do you let them hang? Can you really tell where someone is from based on their accent? Find out!"), Song(title: "Stand By Me", source: "Ben E. King"), Article(id: "Kawhi", title: "Kawhi Leonard and Paul George officially join Los Angeles Clippers", source: "The Guardian"), YoutubeVideo(id: "IevQx1zKNQs", title: "Top 10 Best Celebrity Bottle Cap Challenges", source: "WatchMojo.com", description: "This viral internet challenge shows no sign of slowing down! The bottle cap challenge is sweeping the internet and now tons of celebs are taking part. We’re looking at the most epic celebrity bottle cap challenges from people like Jason Statham, John Mayer and Conor McGregor. Join WatchMojo as we count down our picks for the most memorable celebs who have done the bottle cap challenge. Who do YOU think really nailed the challenge? Let us know in the comments!")])
        let cc4 = ContentCollection(title: "Currently being viewed", contentArray: [Article(id: "FacebookLibra", title: "Facebook announces Libra cryptocurrency: All you need to know", source: "Tech Crunch"), YoutubeVideo(id: "UcxByX6rh24", title: "50 People Show Us Their States' Accents | Culturally Speaking | Condé Nast Traveler", source: "Condé Nast Traveler", description: "In this episode of 'Culturally Speaking,' 50 people from the 50 United States of America attempt to demonstrate the accent from their home state. Does your state have an accent? Do you accent your \"r's\" or do you let them hang? Can you really tell where someone is from based on their accent? Find out!"), Song(title: "Stand By Me", source: "Ben E. King"), Article(id: "Kawhi", title: "Kawhi Leonard and Paul George officially join Los Angeles Clippers", source: "The Guardian"), YoutubeVideo(id: "IevQx1zKNQs", title: "Top 10 Best Celebrity Bottle Cap Challenges", source: "WatchMojo.com", description: "This viral internet challenge shows no sign of slowing down! The bottle cap challenge is sweeping the internet and now tons of celebs are taking part. We’re looking at the most epic celebrity bottle cap challenges from people like Jason Statham, John Mayer and Conor McGregor. Join WatchMojo as we count down our picks for the most memorable celebs who have done the bottle cap challenge. Who do YOU think really nailed the challenge? Let us know in the comments!"), Song(title: "Hey Jude", source: "The Beatles")])
         let cc5 = ContentCollection(title: "Currently being viewed", contentArray: [YoutubeVideo(id: "UcxByX6rh24", title: "50 People Show Us Their States' Accents | Culturally Speaking | Condé Nast Traveler", source: "Condé Nast Traveler", description: "In this episode of 'Culturally Speaking,' 50 people from the 50 United States of America attempt to demonstrate the accent from their home state. Does your state have an accent? Do you accent your \"r's\" or do you let them hang? Can you really tell where someone is from based on their accent? Find out!"), Song(title: "Stand By Me", source: "Ben E. King"), Article(id: "Kawhi", title: "Kawhi Leonard and Paul George officially join Los Angeles Clippers", source: "The Guardian"), YoutubeVideo(id: "IevQx1zKNQs", title: "Top 10 Best Celebrity Bottle Cap Challenges", source: "WatchMojo.com", description: "This viral internet challenge shows no sign of slowing down! The bottle cap challenge is sweeping the internet and now tons of celebs are taking part. We’re looking at the most epic celebrity bottle cap challenges from people like Jason Statham, John Mayer and Conor McGregor. Join WatchMojo as we count down our picks for the most memorable celebs who have done the bottle cap challenge. Who do YOU think really nailed the challenge? Let us know in the comments!"), Song(title: "Hey Jude", source: "The Beatles"), Article(id: "FacebookLibra", title: "Facebook announces Libra cryptocurrency: All you need to know", source: "Tech Crunch")])
        let cc6 = ContentCollection(title: "Currently being viewed", contentArray: [Song(title: "Stand By Me", source: "Ben E. King"), Article(id: "Kawhi", title: "Kawhi Leonard and Paul George officially join Los Angeles Clippers", source: "The Guardian"), YoutubeVideo(id: "IevQx1zKNQs", title: "Top 10 Best Celebrity Bottle Cap Challenges", source: "WatchMojo.com", description: "This viral internet challenge shows no sign of slowing down! The bottle cap challenge is sweeping the internet and now tons of celebs are taking part. We’re looking at the most epic celebrity bottle cap challenges from people like Jason Statham, John Mayer and Conor McGregor. Join WatchMojo as we count down our picks for the most memorable celebs who have done the bottle cap challenge. Who do YOU think really nailed the challenge? Let us know in the comments!"), Song(title: "Hey Jude", source: "The Beatles"), Article(id: "FacebookLibra", title: "Facebook announces Libra cryptocurrency: All you need to know", source: "Tech Crunch"), YoutubeVideo(id: "UcxByX6rh24", title: "50 People Show Us Their States' Accents | Culturally Speaking | Condé Nast Traveler", source: "Condé Nast Traveler", description: "In this episode of 'Culturally Speaking,' 50 people from the 50 United States of America attempt to demonstrate the accent from their home state. Does your state have an accent? Do you accent your \"r's\" or do you let them hang? Can you really tell where someone is from based on their accent? Find out!")])
        
        contentCollections += [cc1, cc2, cc3, cc4, cc5, cc6]
    }
}

class HomeTableCell: UITableViewCell {
    @IBOutlet var columnStack: UIStackView!
    @IBOutlet weak var cellTitleLabel: UILabel!
    
    var collectionController: HomeCollectionViewController?
    var delegate: HomeTableViewController?
    
    @IBAction func seeAllButton(_ sender: UIButton) {
        collectionController?.contentArray = delegate?.contentCollections[0].contentArray
        delegate?.navigationController?.pushViewController(collectionController!, animated: true)
    }
}

struct ContentCollection {
    var title: String
    var contentArray: [Content]
}
