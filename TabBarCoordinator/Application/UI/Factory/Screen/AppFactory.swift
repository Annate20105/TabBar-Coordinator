
import UIKit

protocol AppFactory: AnyObject {
    func makeKeyWindowWithCoordinator() -> (UIWindow, Coordinator)
}
