//
//  Color+Extension.swift
//  MemoApp
//
//  Created by 강채현 on 2021/11/10.
//

import Foundation
import UIKit

enum Colors {
    case backgroundColor
    
    case headerColor // headerView Color
    
    case textColor
    
    case buttonColor
    
    case searchBarColor
}

extension UIColor {
    static func appColor(_ color: Colors) -> UIColor {
        switch color {
        case .backgroundColor:
            return .black
        case .headerColor:
            return #colorLiteral(red: 0.117630966, green: 0.1176582947, blue: 0.1176273599, alpha: 1)
        case .textColor:
            return .white
        case .buttonColor:
            return #colorLiteral(red: 0.9748988748, green: 0.6275316477, blue: 0, alpha: 1)
        case .searchBarColor:
            return #colorLiteral(red: 0.2156612873, green: 0.2157043517, blue: 0.228538394, alpha: 1)
        }
    }
}
