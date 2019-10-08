import UIKit

class YoutubeTableViewController: UITableViewController {
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
        let cellIdentifier = "YoutubeTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? YoutubeTableViewCell else {
            fatalError("The dequeued cell is not an instance of YoutubeTableViewCell.")
        }
        
        cell.youtubeVideo = youtubeVideos[indexPath.row] as? YoutubeVideo

        return cell
    }

    //MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ToYoutubeViewController") {
            let youtubeViewController = segue.destination as! YoutubeViewController
            if let cell = sender as? YoutubeTableViewCell, let indexPath = tableView.indexPath(for: cell) {
                youtubeViewController.youtubeVideo = youtubeVideos[indexPath.row] as? YoutubeVideo
            }
        }
    }
    
    //MARK: Private methods
    private func loadYoutubeVideos() {
        
        let video1 = YoutubeVideo(id: "Cm0MGnuRnH0", title: "Billie Eilish: Same Interview, One Year Apart | Vanity Fair", source: "Vanity Fair", description: "On October 18th, 2017, after a busy day of promotional interviews in New York City, Billie Eilish met with Vanity Fair to discuss the 15-year-old’s breakthrough success. On October 18th, 2018, after a long day of pre-tour rehearsals, Billie spoke with VF again to answer the exact same questions and look back at a time capsule of her answers from last year. Her Instagram follower count grew from 257K to 6.3 million. She went from playing crowds of 500 fans to playing arenas for more than 40,000. See how Billie’s life changed over the last year.\n\nListen to a recomposition of Billie's \"Ocean Eyes\" here:\n\nhttps://soundcloud.com/orbitalmusican...")
        
        let video2 = YoutubeVideo(id: "ffdXLm8EaYg", title: "2019 NBA Finals Game 5 Mini-Movie", source: "NBA", description: "The Golden State Warriors fend off elimination in Game 5 of the 2019 NBA Finals, winning 106-105. The Raptors now lead the series 3 games to 2.  The Warriors were led by Stephen Curry who scored 31 points and Klay Thompson who chipped in 26.  The series now shifts to Oakland for Game 6 and the final game at Oracle Arena.")
        
        let video3 = YoutubeVideo(id: "_99ySDoC1fw", title: "Blind Devotion | Jubilee Media Short Film", source: "Jubilee", description: "Jubilee Media is excited to share \"Blind Devotion\", the second in a series of two short films about unconditional love, in partnership with Pastor Francis Chan and his latest book \"You and Me Forever\".\n\n\"You and Me Forever\" was written by Francis and his wife Lisa on marriage in the light of eternity. Today, 100% of all proceeds from book sales go towards fighting poverty in Africa - projects like building a safe haven village for young women rescued out of prostitution.")
        
        let video4 = YoutubeVideo(id: "KONe4SNFA64", title: "Rihanna's Epic 10-Minute Guide to Going Out Makeup | Beauty Secrets | Vogue", source: "Vogue", description: "In this video makeup tutorial, Rihanna gets real about more-is-more beauty with a little help from Fenty.\n\nDirected by Lucas Flores Piran\n\nFilmed at One&amp;Only Palmilla in Los Cabos")
        
        let video5 = YoutubeVideo(id: "AFxCO_DyzYM", title: "Bruno Mars Carpool Karaoke", source: "The Late Late Show with James Corden", description: "James Corden and Bruno Mars drive through Los Angeles singing his hits, including tracks from the new album \"24K Magic,\" and chat about everything from Elvis to poker. Get Bruno Mars' new album '24K Magic' out now: https://brunom.rs/24kMagic")
        
        let video6 = YoutubeVideo(id: "f_WaxuN4o78", title: "Confessions of a Disney Employee", source: "sWooZie", description: "I land a job working at the most magical place on the planet (Walt Disney World) and finally confess to some of the crazy stuff I did while working there. Key word: 'some'\n\nFun Facts:\n\nThis is not a flash animated video. I did the whole thing using Deviant Arts website to draw everything: http://muro.deviantart.com/ Then animated some scenes with tricks I learned in Final Cut Express.")
        
        let video7 = YoutubeVideo(id: "TB0522Zzrw8", title: "Kawhi Leonard Laughing Compilation", source: "The Sixth Man", description: "This video is longer than I expected...\n\nPlease subscribe and comment for more ideas. Thanks!")
        
        let video8 = YoutubeVideo(id: "KM4Xe6Dlp0Y", title: "Looks aren't everything. Believe me, I'm a model. | Cameron Russell", source: "TED", description: "Cameron Russell admits she won a \"genetic lottery\": she's tall, pretty and an underwear model. But don't judge her by her looks. In this fearless talk, she takes a wry look at the industry that had her looking highly seductive at barely 16-years-old.")
        
        let video9 = YoutubeVideo(id: "IevQx1zKNQs", title: "Top 10 Best Celebrity Bottle Cap Challenges", source: "WatchMojo.com", description: "This viral internet challenge shows no sign of slowing down! The bottle cap challenge is sweeping the internet and now tons of celebs are taking part. We’re looking at the most epic celebrity bottle cap challenges from people like Jason Statham, John Mayer and Conor McGregor. Join WatchMojo as we count down our picks for the most memorable celebs who have done the bottle cap challenge. Who do YOU think really nailed the challenge? Let us know in the comments!")
        
        let video10 =  YoutubeVideo(id: "UcxByX6rh24", title: "50 People Show Us Their States' Accents | Culturally Speaking | Condé Nast Traveler", source: "Condé Nast Traveler", description: "In this episode of 'Culturally Speaking,' 50 people from the 50 United States of America attempt to demonstrate the accent from their home state. Does your state have an accent? Do you accent your \"r's\" or do you let them hang? Can you really tell where someone is from based on their accent? Find out!")
        
        youtubeVideos += [video1, video2, video3, video4, video5, video6, video7, video8, video9, video10]
    }
}

class YoutubeTableViewCell: UITableViewCell {
    //MARK: Properties
    
    var youtubeVideo: YoutubeVideo?
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        thumbnail.image = youtubeVideo?.image
        titleLabel.text = youtubeVideo?.title
        sourceLabel.text = youtubeVideo?.source
    }
}

