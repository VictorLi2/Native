import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    var image: UIImage?
    var title: String?
    var author: String?
    
    let imageView = UIImageView()
    let firstLabel = UILabel.init()
    let secondLabel = UILabel.init()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupDisplay()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Display related
extension HomeCollectionViewCell {
    func setupDisplay() {
        setupImage()
        setupText()
    }
    
    func setupImage() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "TaylorSwift")
        contentView.addSubview(imageView)
        
        imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: 0).isActive = true
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 9/16).isActive = true
    }
    
    func setupText() {
        firstLabel.frame = CGRect(x: 5, y: 80, width: 150, height: 50)
        firstLabel.lineBreakMode = .byTruncatingTail
        firstLabel.textAlignment = .left
        firstLabel.adjustsFontSizeToFitWidth = true
        firstLabel.minimumScaleFactor = 0.1
        firstLabel.numberOfLines = 2
        firstLabel.text = "abcfsdajfklsadgbonerewkfavdfbwergafwe"
        
        secondLabel.frame = CGRect(x: 5, y: 130, width: 150, height: 20)
        secondLabel.lineBreakMode = .byTruncatingTail
        secondLabel.textAlignment = .left
        secondLabel.numberOfLines = 1
        secondLabel.text = "wafdbhorwiejavdfknbgraweaojig"
        
        contentView.addSubview(firstLabel)
        contentView.addSubview(secondLabel)
    }
}
