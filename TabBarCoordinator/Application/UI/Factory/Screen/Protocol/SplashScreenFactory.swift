
import Foundation

protocol SplashScreenFactory {
    func makeSplashScreen() -> SplashScreenVC<SplashScreenViewImpl>
}
