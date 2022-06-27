
import UIKit

class SplashScreenVC<View: BaseScreenView>: BaseViewController<View> {
    
    //MARK: - Closure

    open var onFinishShowScreen: VoidClosure?
    
    //MARK: - Deinit

    deinit {
        print(String(describing: self))
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        dispatchAfterOnUi(1.0) {[weak self] in
            self?.onFinishShowScreen?()
        }
    }
}


