import UIKit

final class DI {
    
    fileprivate let coordinatorFactory: CoordinatorFactory
    fileprivate let screenFactory: ScreenFactory
 
    
    init() {        
        screenFactory = ScreenFactoryImpl()
        coordinatorFactory = CoordinatorFactoryImpl(screenFactory: self.screenFactory)
        (screenFactory as? ScreenFactoryImpl)?.di = self
    }

}

extension DI: AppFactory {
    
    func makeKeyWindowWithCoordinator() -> (UIWindow, Coordinator) {
        let window = UIWindow()
        let rootVC = BaseNavigationController()
        let router = RouterImp(rootController: rootVC)
        let cooridnator = coordinatorFactory.makeAppCoordinator(router: router)
        window.rootViewController = rootVC
        return (window, cooridnator)
    }
    
}
