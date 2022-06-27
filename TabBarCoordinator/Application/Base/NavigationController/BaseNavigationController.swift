
import UIKit

class BaseNavigationController: UINavigationController {

    //MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = .white
        self.navigationBar.tintColor = .red
        self.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.orange]

    }
}
