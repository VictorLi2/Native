import UIKit
import FBSDKLoginKit

class FacebookLoginButton: FBLoginButton {
    override func updateConstraints() {
        for constraint in constraints {
            if constraint.firstAttribute == .height, constraint.constant < 40 {
                // deactivate this constraint
                constraint.isActive = false
            }
        }
        super.updateConstraints()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 40)
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        let logoSize: CGFloat = 24.0
        let centerY = contentRect.midY
        let y: CGFloat = centerY - (logoSize / 2.0)
        return CGRect(x: y, y: y, width: logoSize, height: logoSize)
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        if isHidden || bounds.isEmpty {
            return .zero
        }
        
        let imageRect = self.imageRect(forContentRect: contentRect)
        let titleX = imageRect.maxX
        let titleRect = CGRect(x: titleX, y: 0, width: contentRect.width - titleX - titleX, height: contentRect.height)
        return titleRect
    }
}
