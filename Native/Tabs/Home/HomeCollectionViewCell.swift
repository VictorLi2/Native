import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    var image: UIImage?
    var title: String?
    var author: String?
    
    let imageView = UIImageView()
    let firstLabel = UILabel.init()
    
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
        firstLabel.lineBreakMode = .byWordWrapping
        firstLabel.textAlignment = .left
        firstLabel.numberOfLines = 0
        firstLabel.text = "abcd ABCD AAAAAAA"
        firstLabel.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: 50)
        contentView.addSubview(firstLabel)
        
        firstLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    }
}
