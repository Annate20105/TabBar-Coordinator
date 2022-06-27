import UIKit

protocol Presentable: AnyObject {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
  
    func toPresent() -> UIViewController? {
        return self
    }
}

protocol Router: Presentable {
  
    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool)

    func push(_ module: Presentable?)
    func push(_ module: Presentable?, hideBottomBar: Bool)
    func push(_ module: Presentable?, animated: Bool)
    func push(_ module: Presentable?, animated: Bool, completion: (() -> Void)?)
    func push(_ module: Presentable?, animated: Bool, hideBottomBar: Bool, completion: (() -> Void)?)

    func popModule()
    func popModule(animated: Bool)
    
    func pop(to classController: AnyClass)
    
    func dismissModule()
    func dismissModule(animated: Bool, completion: (() -> Void)?)

    func setRootModule(_ module: Presentable?)
    func setRootModule(_ module: Presentable?, hideBar: Bool)
  
    func popToRootModule(animated: Bool)
    
    func swap(viewControllers controllers: [UIViewController])
    func swap(viewController controller: UIViewController)
    func swap(viewController controller: UIViewController, animated:Bool)
    func swap(viewControllers controllers: [UIViewController], animated:Bool)
}


final class RouterImp: Router {
  
    private weak var rootController: UINavigationController?
    private var completions: [UIViewController : () -> Void]
  
    init(rootController: UINavigationController) {
        self.rootController = rootController
        completions = [:]
    }
  
    func toPresent() -> UIViewController? {
        return rootController
    }
  
    func present(_ module: Presentable?) {
        present(module, animated: true)
    }
  
    func present(_ module: Presentable?, animated: Bool) {
        guard let controller = module?.toPresent() else { return }
        rootController?.present(controller, animated: animated, completion: nil)
    }
  
    func dismissModule() {
        dismissModule(animated: true, completion: nil)
    }
  
    func dismissModule(animated: Bool, completion: (() -> Void)?) {
        rootController?.dismiss(animated: animated, completion: completion)
    }
  
    func push(_ module: Presentable?)  {
        push(module, animated: true)
    }
    
    func push(_ module: Presentable?, hideBottomBar: Bool)  {
        push(module, animated: true, hideBottomBar: hideBottomBar, completion: nil)
    }
  
    func push(_ module: Presentable?, animated: Bool)  {
        push(module, animated: animated, completion: nil)
    }
  
    func push(_ module: Presentable?, animated: Bool, completion: (() -> Void)?) {
        push(module, animated: animated, hideBottomBar: false, completion: completion)
    }

    func push(_ module: Presentable?, animated: Bool, hideBottomBar: Bool, completion: (() -> Void)?) {
        guard
            let controller = module?.toPresent(),
            (controller is UINavigationController == false)
        else { assertionFailure("Deprecated push UINavigationController."); return }
    
        if let completion = completion {
            completions[controller] = completion
        }
        controller.hidesBottomBarWhenPushed = hideBottomBar
        rootController?.pushViewController(controller, animated: animated)
    }
  
    func popModule()  {
        popModule(animated: true)
    }

    func popModule(animated: Bool)  {
        if let controller = rootController?.popViewController(animated: animated) {
            runCompletion(for: controller)
        }
    }

    func setRootModule(_ module: Presentable?) {
        setRootModule(module, hideBar: false)
    }

    func setRootModule(_ module: Presentable?, hideBar: Bool) {
        guard let controller = module?.toPresent() else { return }
        rootController?.setViewControllers([controller], animated: false)
        rootController?.isNavigationBarHidden = hideBar
    }

    func popToRootModule(animated: Bool) {
        if let controllers = rootController?.popToRootViewController(animated: animated) {
            controllers.forEach { controller in
                runCompletion(for: controller)
            }
        }
    }
    
    func pop(to classController: AnyClass) {
        guard let controllers = rootController?.viewControllers else {
            return
        }
        var controller:UIViewController? = nil
        for vc in controllers {
            if vc.classForCoder == classController {
                controller = vc
            }
        }
        if let controller = controller {
            rootController?.popToViewController(controller, animated: true)
        }
    }
    
    func swap(viewControllers controllers: [UIViewController]) {
        swap(viewControllers: controllers, animated: true)
    }
    
    func swap(viewController controller: UIViewController) {
        swap(viewControllers: [controller], animated: true)
    }

    func swap(viewController controller: UIViewController, animated:Bool) {
        swap(viewControllers: [controller], animated: animated)
    }
    
    func swap(viewControllers controllers: [UIViewController], animated:Bool) {
        if var viewControllers = rootController?.viewControllers {
            viewControllers.removeLast()
            viewControllers.append(contentsOf: controllers)
            self.rootController?.setViewControllers(viewControllers, animated: animated)
        }
    }
        
    private func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }
    
}
