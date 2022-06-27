
import Foundation

enum TabBarPage:Int, CaseIterable {
    
    case first, second, third
    
    
    func iconImageName() -> String {
        switch self {
        case .first:
            return ""
        case .second:
            return ""
        case .third:
            return ""
        }
    }
    
    func selectedIconImageName() -> String {
        switch self {
        case .first:
            return ""
        case .second:
            return ""
        case .third:
            return ""
        }
    }
    
    func title() -> String {
        switch self {
        case .first:
            return "first"
        case .second:
            return "second"
        case .third:
            return "third"
        }
    }
    
}

