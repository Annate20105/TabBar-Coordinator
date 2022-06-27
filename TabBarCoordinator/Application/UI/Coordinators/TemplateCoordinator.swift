//
//  TemplateCoordinator.swift
//  TabBarCoordinator
//
//  Created by Anna Dudina on 27.06.2022.
//

import UIKit

class TemplateCoordinator: BaseCoordinator {
    
    //MARK: - Public
        
    //MARK: - Private
    private let screenFactory: TemplateScreenFactory
    private let router: Router
    
    //MARK: - Init
    init(router: Router,
         screenFactory: TemplateScreenFactory) {
        self.screenFactory = screenFactory
        self.router = router
    }
    
    //MARK: - Override
    override func start() {
        startTemplateFlow()
    }
}

private extension TemplateCoordinator {
    
    private func startTemplateFlow() {
        let templateScreen = screenFactory.makeTamplateScreen()
        templateScreen.view.backgroundColor = .random
        router.setRootModule(templateScreen)
    }
    
}
