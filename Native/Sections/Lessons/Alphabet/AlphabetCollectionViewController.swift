import UIKit

private let reuseIdentifier = "AlphabetCollectionViewCell"

class AlphabetCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar(title: "Alphabet Trainer")
    }

    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ToAlphabetLetterViewController") {
            let alphabetLetterViewController = segue.destination as! AlphabetLetterViewController
            if let cell = sender as? AlphabetCollectionViewCell, let indexPath = collectionView.indexPath(for: cell) {
                alphabetLetterViewController.letter = alphabet[indexPath.row]
            }
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return alphabet.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? AlphabetCollectionViewCell else {
            fatalError("The dequeued cell is not an instance of AlphabetCollectionViewCell.")
        }
    
        // Configure the cell
        cell.letter = alphabet[indexPath.row]
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 60) / 3, height: (UIScreen.main.bounds.width - 60) / 3)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
}

class AlphabetCollectionViewCell: UICollectionViewCell {
    // MARK: Properties
    var letter: String?
    
    // MARK: Outlets
    @IBOutlet weak var letterLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentView.layer.cornerRadius = 5.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.black.cgColor
        
        letterLabel.text = letter
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        letterLabel.text = ""
    }
}
