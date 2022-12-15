//
//  FontStyle.swift
//  TWC
//
//  Created by Jacky on 20/10/2021.
//

import UIKit

/// In order to add new custom, add .ttf,set target membership and add font to Info,plist
enum FontStyle {

    case regular

    var font: UIFont? {
        switch self {
        case .regular:
//            return UIFont(name: .regular, size: .normal)
            return UIFont.systemFont(ofSize: .normal)
        }
    }

}

extension UIFont {

    convenience init?(name: FontStyle.FontName, size: FontStyle.FontSize) {
        self.init(name: name.rawValue, size: size.size)
    }

    static func systemFont(ofSize size: FontStyle.FontSize) -> UIFont {
        return .systemFont(ofSize: size.size)
    }

}

// MARK: - FontName

extension FontStyle {

    enum FontName: String {

        case regular = "NotoSansTC-Regular"

    }

}

// MARK: - TextSize

extension FontStyle {

    enum FontSize {

        case normal

        var size: CGFloat {
            switch self {
            case .normal:
                return 14
            }
        }

    }

}
