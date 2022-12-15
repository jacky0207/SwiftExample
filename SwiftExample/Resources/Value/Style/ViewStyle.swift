//
//  ViewStyle.swift
//  SwiftExample
//
//  Created by Jacky Lam on 16/4/2021.
//

import UIKit

protocol Stylable {

    init(frame: CGRect)

}

struct ViewStyle<T> {

    let style: (T) -> Void

}

extension Stylable {

    init(style: ViewStyle<Self>) {
        self.init(frame: .zero)
        apply(style)
    }

    init(style: ViewStyle<Self>, arrangedSubviews views: [UIView]) where Self == UIStackView {
        self.init(arrangedSubviews: views)
        apply(style)
    }

    init(style: ViewStyle<Self>, tableViewStyle: UITableView.Style) where Self == UITableView {
        self.init(frame: .zero, style: tableViewStyle)
        apply(style)
    }

    init(style: ViewStyle<Self>, collectionViewLayout layout: UICollectionViewLayout) where Self == UICollectionView {
        self.init(frame: .zero, collectionViewLayout: layout)
        apply(style)
    }

    func apply(_ style: ViewStyle<Self>) {
        style.style(self)
    }

}

extension Stylable where Self: UISegmentedControl {

    init(items: [Any]?, style: ViewStyle<Self>) {
        self.init(items: items)
        apply(style)
    }

}

extension UIView: Stylable {}

// MARK: Controller

extension UINavigationController {

    convenience init(rootViewController: UIViewController, style: ViewStyle<UINavigationBar>) {
        self.init(rootViewController: rootViewController)
        navigationBar.apply(style)
    }

}

extension UISearchController {

    convenience init(searchResultsController: UIViewController?, style: ViewStyle<UISearchBar>) {
        self.init(searchResultsController: searchResultsController)
        searchBar.apply(style)
    }

}

// MARK: - UINavigationBar

extension ViewStyle where T: UINavigationBar {

    static var `default`: ViewStyle<UINavigationBar> {
        return .init { (view) in
            view.prefersLargeTitles = true  // enabled large titles
                                            // set view controller large title display mode by UINavigationItem.largeTitleDisplayMode
            view.isTranslucent = true  // enable backgroundd color transparent
            view.clipsToBounds = false
            view.backgroundColor = ColorHex.background.color

            // title
            // different version has different setting
            // Ref: https://medium.com/%E5%BD%BC%E5%BE%97%E6%BD%98%E7%9A%84-swift-ios-app-%E9%96%8B%E7%99%BC%E5%95%8F%E9%A1%8C%E8%A7%A3%E7%AD%94%E9%9B%86/ios-15-navigation-bar-tab-bar-%E7%9A%84%E6%A8%A3%E5%BC%8F%E8%A8%AD%E5%AE%9A-558f07137b52
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()  // enable backgroundd color transparent
            appearance.backgroundColor = .clear
            appearance.backgroundEffect = UIBlurEffect(style: .light)
            appearance.shadowColor = .clear
            appearance.shadowImage = UIImage()  // remove default shadow image
            appearance.titleTextAttributes = [
                .foregroundColor: ColorHex.primary.color,
                .font: FontStyle.regular.font!
            ]
            view.standardAppearance = appearance
            view.scrollEdgeAppearance = appearance
            view.compactAppearance = appearance
            if #available(iOS 15.0, *) {
                view.compactScrollEdgeAppearance = appearance
            }
        }
    }

}

// MARK: - UITableView

extension ViewStyle where T: UITableView {

    static var `default`: ViewStyle<T> {
        return .init { (view) in
            view.backgroundColor = .none
            view.separatorStyle = .none
            // fixed section header top padding in iOS 15
            if #available(iOS 15.0, *) {
                view.sectionHeaderTopPadding = 0
            }
        }
    }

}

// MARK: UILabel

extension ViewStyle where T: UILabel {

    static var `default`: ViewStyle<T> {
        return regular
    }

    static var regular: ViewStyle<T> {
        return .init { (view) in
            view.font = FontStyle.regular.font
            view.textColor = ColorHex.primary.color
        }
    }

}

// MARK: UITextField

extension ViewStyle where T: UITextField {

    static var `default`: ViewStyle<T> {
        return .init { (view) in
        }
    }

}

// MARK: UIButton

extension ViewStyle where T: UIButton {

    static var `default`: ViewStyle<T> {
        return filled
    }

    static var filled: ViewStyle<T> {
        return .init { (view) in
            // title
            view.titleLabel?.apply(.regular)
            view.setTitleColor(ColorHex.primary.color, for: .normal)
            view.setTitleColor(ColorHex.primaryHighlight.color, for: .highlighted)
            view.setTitleColor(ColorHex.primaryDisabled.color, for: .disabled)
        }
    }

}

// MARK: UIImageView

extension ViewStyle where T: UIImageView {

    static var `default`: ViewStyle<T> {
        return .init { (_) in

        }
    }

}

// MARK: UIStackView

extension ViewStyle where T: UIStackView {

    static var `default`: ViewStyle<T> {
        return .init { (_) in

        }
    }

}
