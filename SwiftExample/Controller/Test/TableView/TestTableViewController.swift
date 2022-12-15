//
//  TestTableViewController.swift
//  SwiftExample
//
//  Created by Jacky Lam on 29/11/2022.
//

import UIKit

class TestTableViewController: ViewController<TestTableViewModel>, DiffableDataSourceViewUI {
    enum Section: Hashable, CaseIterable {
        case item
    }

    enum Row: Hashable {
        case label(TestLabelCellData)
    }

    private var tableView: UITableView!
    private(set) lazy var tableViewDataSource: UITableViewDiffableDataSource<Section, Row> = {
        return UITableViewDiffableDataSource<Section, Row>(tableView: tableView) { tableView, indexPath, itemIdentifier in
            switch itemIdentifier {
            case .label(let data):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: TestLabelCell.identifier, for: indexPath) as? TestLabelCell else {
                    return EmptyCell()
                }

                cell.update(for: data)
                return cell
            }
        }
    }()

    override func initializeView() {
        super.initializeView()

        tableView = TableView(style: .default)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TestLabelCell.self, forCellReuseIdentifier: TestLabelCell.identifier)
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        reloadSnapshot()
    }

    // MARK: Data

    private var items: [String] = Array(repeating: "Row", count: 100)

    func reloadSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Row>()
        snapshot.appendSections(Section.allCases)
        if !items.isEmpty {
            snapshot.appendItems(items.map { .label(TestLabelCellData(text: $0)) }, toSection: .item)
        }
        tableViewDataSource.apply(snapshot)
    }
}
