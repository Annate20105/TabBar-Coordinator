import UIKit

final class AppCoordinator: BaseCoordinator {
    
    fileprivate var isFirst:Bool = true

    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    
    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        if self.isFirst {
            startSplashFlow()
        } else {
            self.startTabBarFlow()
        }
    }

}


//MARK: - Flow
private extension AppCoordinator {
    
    private func startSplashFlow() {
        let coordinator = coordinatorFactory.makeSplashCoordinator(router: router)
        coordinator.finishCoordinatorFlow = { [weak self, weak coordinator] in
            guard let self = self else {return}
            self.isFirst = false
            self.removeDependency(coordinator)
            self.start()
        }
        self.addDependency(coordinator)
        coordinator.start()
    }
    
    
    private func startTabBarFlow() {
        let coordinator = coordinatorFactory.makeTabBarCoordinator(router: router)
        self.addDependency(coordinator)
        coordinator.start()
    }

}
