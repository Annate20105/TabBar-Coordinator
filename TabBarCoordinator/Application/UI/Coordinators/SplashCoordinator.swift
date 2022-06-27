//
//  SplashCoordinator.swift
//  Cleaning
//
//  Created by Anna Dudina on 22.02.2021.
//

import UIKit

class SplashCoordinator: BaseCoordinator {
    
    //MARK: - Public
    
    var finishCoordinatorFlow:VoidClosure?
    
    //MARK: - Private
    private let screenFactory: SplashScreenFactory
    private let router: Router
    
    //MARK: - Init
    init(router: Router,
         screenFactory: SplashScreenFactory) {
        self.screenFactory = screenFactory
        self.router = router
    }
    
    //MARK: - Override
    override func start() {
        startSplashFlow()
    }
}

private extension SplashCoordinator {
    
    private func startSplashFlow() {
        let splashScreen = screenFactory.makeSplashScreen()
        splashScreen.onFinishShowScreen = self.finishCoordinatorFlow
        router.setRootModule(splashScreen, hideBar: true)
    }
    
}
