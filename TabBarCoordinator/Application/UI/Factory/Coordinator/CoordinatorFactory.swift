
import UIKit


protocol CoordinatorFactory:AnyObject {
    
    func makeAppCoordinator(router: Router) -> AppCoordinator
    
    func makeSplashCoordinator(router: Router) -> SplashCoordinator
    
    func makeTabBarCoordinator(router: Router) -> TabBarCoordinator
    
    func makeTemplateCoordinator(router: Router) -> TemplateCoordinator
}


final class CoordinatorFactoryImpl: CoordinatorFactory {
    
    private let screenFactory:ScreenFactory!
    
    init(screenFactory:ScreenFactory) {
        self.screenFactory = screenFactory
    }
    
    func makeAppCoordinator(router: Router) -> AppCoordinator {
        AppCoordinator(router: router, coordinatorFactory: self)
    }
    
    //MARK: - Splash
    func makeSplashCoordinator(router: Router) -> SplashCoordinator {
        SplashCoordinator(router: router, screenFactory: screenFactory)
    }
    
    
    //MARK: - TabBar
    func makeTabBarCoordinator(router: Router) -> TabBarCoordinator {
        TabBarCoordinator(router: router, coordinatorFactory: self, screenFactory: screenFactory)
    }
    
    func makeTemplateCoordinator(router: Router) -> TemplateCoordinator {
        TemplateCoordinator(router: router, screenFactory: screenFactory)
    }
}
