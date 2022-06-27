//
//  AppDelegate.swift
//  TabBarCoordinator
//
//  Created by Anna Dudina on 27.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var appCoordinator: Coordinator?
    private let appFactory: AppFactory = DI()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch
        runUI()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    //MARK: - Start Flow
    private func runUI() {
            let (window, coordinator) = appFactory.makeKeyWindowWithCoordinator()
            self.window = window
            self.appCoordinator = coordinator
            window.makeKeyAndVisible()
            self.appCoordinator?.start()
    }

}

