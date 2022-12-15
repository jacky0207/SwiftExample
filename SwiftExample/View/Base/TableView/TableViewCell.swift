//
//  TableViewCell.swift
//  SwiftExample
//
//  Created by Jacky Lam on 29/11/2022.
//

import UIKit

open class TableViewCell<Data: TableViewCellData>: UITableViewCell {
    static var identifier: String {
        return String(describing: Self.self)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews(for: contentView)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func setupViews(for view: UIView) {}

    open func update(for data: Data) {}
}

public protocol TableViewCellData: Hashable {
    var uuid: UUID { get }
}
