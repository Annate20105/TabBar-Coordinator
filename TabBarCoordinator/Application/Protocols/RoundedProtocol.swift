
import UIKit

protocol RoundedProtocol:AnyObject {
    
    func applyRounding(cornerRadius:CGFloat,
                       borderWidth:CGFloat,
                       borderColor:UIColor?)
    
}


extension RoundedProtocol where Self:UIView {

    func applyRounding(cornerRadius:CGFloat = 15.0,
                       borderWidth:CGFloat = 0.0,
                       borderColor:UIColor? = UIColor.clear) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor?.cgColor
    }
}
