//
//  Dimen.swift
//  TWC
//
//  Created by Jacky on 20/10/2021.
//

import UIKit

struct Dimen {

    static let shared = Dimen()

    private let screenScaled = true

    private init() {}

    func dimen(_ dimen: CGFloat) -> CGFloat {
        let scaledDimen = screenScaled ? dimen * UIScreen.screenScaledRatio : dimen

        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            return scaledDimen
        case .phone:
            return scaledDimen / 2
        default:
            return scaledDimen
        }
    }

}

extension UIScreen {

    static var screenWidth: CGFloat = UIScreen.main.bounds.width

    static var screenHeight: CGFloat = UIScreen.main.bounds.height

    static var minScreenWidth: CGFloat = 375

    /// Ratio of screen width divided by min. screen width
    static var screenScaledRatio: CGFloat = screenWidth / minScreenWidth

}

extension Dimen {

    static func dimen(_ dimen: CGFloat) -> CGFloat {
        return shared.dimen(dimen)
    }

    /// Calculate width by screen width minus given width.
    /// Not recommednd to use since width always calculate using horizontal padding
    static func dimen(ofScreenWidthMinusByScaledDimen dimen: CGFloat) -> CGFloat {
        return UIScreen.screenWidth - dimen
    }

}
