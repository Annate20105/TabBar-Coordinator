
import UIKit
import Combine

class BaseViewController<View: BaseScreenView>: UIViewController {

    var rootView: View { view as! View }
    
    var subscriptions = Set<AnyCancellable>()

    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        view = View.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rootView.onInitUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.endEditing(true)
    }
    
    func setNavigationBarHidden(_ value: Bool, animated: Bool = false) {
        self.navigationController?.setNavigationBarHidden(value, animated: animated)
    }    
    
}


