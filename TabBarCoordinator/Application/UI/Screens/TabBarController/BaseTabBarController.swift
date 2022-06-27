//
//  BaseTabBarController.swift
//  Cleaning
//
//  Created by Anna Dudina on 26.02.2021.
//

import UIKit
import Combine

class BaseTabBarController : UITabBarController {
    
    //MARK: - Tab Bar Flow
    var onFirstFlowSelect: ((BaseNavigationController) -> ())?
    var onSecondFlowSelect: ((BaseNavigationController) -> ())?
    var onThirdFlowSelect: ((BaseNavigationController) -> ())?

    var onViewDidLoad: ((BaseNavigationController) -> ())?

    //MARK: - Private Properties
    fileprivate var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        self.viewControllers = TabBarPage.allCases.map({ page in
            let controller = BaseNavigationController()
            let imageName = page.iconImageName()
            let selectedImage = page.selectedIconImageName()
            
            controller.tabBarItem = UITabBarItem(title: page.title(),
                                                 image: UIImage(named:imageName),
                                                 selectedImage: UIImage(named:selectedImage))
            return controller
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let controller = viewControllers?.first as? BaseNavigationController {
            onViewDidLoad?(controller)
        }
    }
    
}



//MARK: - UITabBarControllerDelegate
extension BaseTabBarController : UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let controller = viewControllers?[selectedIndex] as? BaseNavigationController else { return }
        guard let page = TabBarPage(rawValue: selectedIndex) else { return }
        self.selectFlow(with: page, to: controller)
    }
    
}


//MARK: - Help

extension BaseTabBarController  {
    
    private func configureUI() {
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = .white
        self.tabBar.unselectedItemTintColor = .blue
        self.delegate = self
    }
    
    private func selectFlow(with page: TabBarPage, to controller: BaseNavigationController) {
        switch page {
        case .first:
            onFirstFlowSelect?(controller)
        case .second:
            onSecondFlowSelect?(controller)
        case .third:
            onThirdFlowSelect?(controller)
        }
    }
    
    private func moveTo(page: TabBarPage) {
        self.selectedIndex = page.rawValue
        guard let controller = viewControllers?[page.rawValue] as? BaseNavigationController else { return }
        self.selectFlow(with: page, to: controller)
    
    }
    
    
}
