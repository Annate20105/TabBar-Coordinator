
import UIKit

typealias SplashProtocol = SplashScreenFactory
typealias TabBarProtocol = TabBarScreenFactory

protocol ScreenFactory: SplashProtocol, TabBarProtocol, TemplateScreenFactory {

}

final class ScreenFactoryImpl: ScreenFactory {

    weak var di: DI!

    //MARK: - Splash

    func makeSplashScreen() -> SplashScreenVC<SplashScreenViewImpl> {
        SplashScreenVC<SplashScreenViewImpl>()
    }
    
    //MARK: - TabBar
    
    func makeTabBarScreen() -> BaseTabBarController {
        BaseTabBarController()
    }
    
    //MARK: - Template
    
    func makeTamplateScreen() -> UIViewController {
        return UIViewController()
    }
}
