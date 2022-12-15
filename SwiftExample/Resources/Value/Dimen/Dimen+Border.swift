//
//  Dimen+Border.swift
//  TWC
//
//  Created by Jacky on 25/10/2021.
//

import UIKit

extension Dimen {

    func border(_ border: Border) -> CGFloat {
        return border.rawValue
    }

}

extension Dimen {

    static func border(_ border: Border) -> CGFloat {
        return shared.border(border)
    }

}

extension Dimen {

    enum Border: CGFloat {

        case small = 1

        case normal = 1.5

        case large = 2

    }

}
