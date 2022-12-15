//
//  NavigationBarUtil.swift
//  SwiftExample
//
//  Created by Jacky Lam on 17/5/2021.
//

import UIKit

extension NavigationItemManager {

    public enum ItemDirection {

        case left

        case right

    }

    public enum ItemType {

        case back

        case done

    }

}

public class NavigationItemManager {

    private var navigationItem: UINavigationItem!

    weak var delegate: NavigationItemManagerDelegate?

    init(navigationItem: UINavigationItem) {
        self.navigationItem = navigationItem
    }

    func setButtonItems(itemTypes: [ItemType], direction: ItemDirection) {
        // not implemented
    }

}

// MARK: - NavigationItemManagerDelegate

protocol NavigationItemManagerDelegate: NSObjectProtocol {

}

extension NavigationItemManagerDelegate {

}
