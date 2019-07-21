import UIKit

extension UIView {
    func addBackground(imageName: String) {
        let imageViewBackground = UIImageView(frame: UIScreen.main.bounds)
        let backgroundImages = ["Aït Benhaddou, Morocco", "Kyōto-shi, Japan", "Kyoto, Japan", "Los Glaciares National Park, Argentina", "Mutianyu Great Wall, China", "Paris, France", "Rio de Janeiro, Brazil"]
        
        if(imageName == "random") {
            imageViewBackground.image = UIImage(named: backgroundImages.randomElement()!)
        } else {
            imageViewBackground.image = UIImage(named: imageName)
        }
       
        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill
        
        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
    }
}
