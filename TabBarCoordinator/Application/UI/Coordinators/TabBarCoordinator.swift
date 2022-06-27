//
//  TabBarCoordinator.swift
//  SMAComfy
//
//  Created by Anna Dudina on 09.09.2020.
//  Copyright © 2020 Comfy. All rights reserved.
//

import UIKit
import Combine

class TabBarCoordinator: BaseCoordinator {
    
    // MARK: - Private
    
    private let coordinatorFactory: CoordinatorFactory
    
    private let screenFactory: TabBarScreenFactory
    
    private let router: Router
    
//    private var tabBarScreen: BaseTabBarController!
    
    
    // MARK: - Initialization
    
    init(
        router: Router,
        coordinatorFactory: CoordinatorFactory,
        screenFactory:TabBarScreenFactory
    ) {
        self.coordinatorFactory = coordinatorFactory
        self.router = router
        self.screenFactory = screenFactory
        super.init()
    }
    
    // MARK: - Lifecycle
    
    override func start() {
        self.startTabBarFlow()
    }
    

    
}

private extension TabBarCoordinator {
    
    private func startTabBarFlow()  {
        let tabBarScreen = screenFactory.makeTabBarScreen()
        tabBarScreen.onViewDidLoad = showFirstScreen()
        tabBarScreen.onFirstFlowSelect = showFirstScreen()
        tabBarScreen.onSecondFlowSelect = showSecondScreen()
        tabBarScreen.onThirdFlowSelect = showThirdScreen()
        self.router.setRootModule(tabBarScreen, hideBar: true)
    }

}

private extension TabBarCoordinator {
    
    private func showFirstScreen() -> ((BaseNavigationController) -> ()) {
        return { [unowned self] nvc in
            if nvc.viewControllers.isEmpty == true {
                let coordinator = self.coordinatorFactory.makeTemplateCoordinator(router: RouterImp(rootController: nvc))
                self.addDependency(coordinator)
                coordinator.start()
            }
        }
    }
    
    private func showSecondScreen() -> ((BaseNavigationController) -> ()) {
        return { [unowned self] nvc in
            if nvc.viewControllers.isEmpty == true {
                let coordinator = self.coordinatorFactory.makeTemplateCoordinator(router: RouterImp(rootController: nvc))
                self.addDependency(coordinator)
                coordinator.start()
            }
        }
    }
    
    private func showThirdScreen() -> ((BaseNavigationController) -> ()) {
        return { [unowned self] nvc in
            if nvc.viewControllers.isEmpty == true {
                let coordinator = self.coordinatorFactory.makeTemplateCoordinator(router: RouterImp(rootController: nvc))
                self.addDependency(coordinator)
                coordinator.start()
            }
        }
    }
    


}
