//
//  Dimen+Width.swift
//  TWC
//
//  Created by Jacky on 25/10/2021.
//

import UIKit

extension Dimen {

    func width(_ width: Width) -> CGFloat {
        return dimen(width.value)
    }

}

extension Dimen {

    static func width(_ width: Width) -> CGFloat {
        return shared.width(width)
    }

}

extension Dimen {

    enum Width {

        case button

        var value: CGFloat {
            switch self {
            case .button:
                return 165
            }
        }

    }

}
