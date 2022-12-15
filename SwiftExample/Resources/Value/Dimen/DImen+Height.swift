//
//  DImen+Height.swift
//  TWC
//
//  Created by Jacky on 25/10/2021.
//

import UIKit

extension Dimen {

    func height(_ height: Height) -> CGFloat {
        return dimen(height.value)
    }

}

extension Dimen {

    static func height(_ height: Height) -> CGFloat {
        return shared.height(height)
    }

}

extension Dimen {

    enum Height {

        case button

        var value: CGFloat {
            switch self {
            case .button:
                return 35
            }
        }

    }

}
