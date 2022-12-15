//
//  DiffableDataSourceViewUI.swift
//  SwiftExample
//
//  Created by Jacky Lam on 29/11/2022.
//

import UIKit

protocol DiffableDataSourceViewUI {
    associatedtype Section: Hashable, CaseIterable
    associatedtype Row: Hashable

    var tableViewDataSource: UITableViewDiffableDataSource<Section, Row> { get }

    func reloadSnapshot()
}
