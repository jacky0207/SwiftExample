//
//  Dimen+Spacing.swift
//  TWC
//
//  Created by Jacky on 25/10/2021.
//

import UIKit

extension Dimen {

    func spacing(_ spacing: Spacing) -> CGFloat {
        return dimen(spacing.value)
    }

}

extension Dimen {

    static func spacing(_ spacing: Spacing) -> CGFloat {
        return shared.spacing(spacing)
    }

}

extension Dimen {

    enum Spacing {

        case small

        case normal

        case large

        var value: CGFloat {
            switch self {
            case .small:
                return 10
            case .normal:
                return 15
            case .large:
                return 20
            }
        }

    }

}
