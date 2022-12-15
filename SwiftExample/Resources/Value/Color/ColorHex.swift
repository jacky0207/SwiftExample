//
//  ColorHex.swift
//  TWC
//
//  Created by Jacky on 20/10/2021.
//

import UIKit

enum ColorHex {

    case primary

    case primaryHighlight

    case primaryDisabled

    case background

    var value: Int {
        switch self {
        case .primary:
            return 0x000000
        case .primaryHighlight:
            return 0x777777
        case .primaryDisabled:
            return 0x333333
        case .background:
            return 0xFFFFFF
        }
    }

    var color: UIColor {
        return UIColor(hex: value)!
    }

}

extension UIColor {

    convenience init?(hex: Int) {
        let alpha = hex > 0xFFFFFF ? (CGFloat((hex >> 24) & 0xff) / 255): 1
        let red = CGFloat((hex >> 16) & 0xff) / 255
        let green = CGFloat((hex >> 8) & 0xff) / 255
        let blue = CGFloat(hex & 0xff) / 255

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

}
