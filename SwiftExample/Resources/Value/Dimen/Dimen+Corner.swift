//
//  Dimen+Corner.swift
//  TWC
//
//  Created by Jacky on 25/10/2021.
//

import UIKit

extension Dimen {

    func corner(_ corner: Corner) -> CGFloat {
        return corner.rawValue
    }

}

extension Dimen {

    static func corner(_ corner: Corner) -> CGFloat {
        return shared.corner(corner)
    }

}

extension Dimen {

    enum Corner: CGFloat {

        case small = 4

        case normal = 8

        case large = 16

    }

}
