import UIKit

protocol BlurredProtocol:AnyObject {
    
    func applyBlurEffect()
    
}


extension BlurredProtocol where Self:UIView {

    func applyBlurEffect() {
        if !UIAccessibility.isReduceTransparencyEnabled {
            let blurEffect = UIBlurEffect(style: .dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = self.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(blurEffectView)
        } else {
            self.backgroundColor = .black
        }
    }
}
