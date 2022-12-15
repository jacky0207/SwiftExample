//
//  TestLabelCell.swift
//  SwiftExample
//
//  Created by Jacky Lam on 29/11/2022.
//

import UIKit

final class TestLabelCell: TableViewCell<TestLabelCellData> {
    private var label: UILabel!

    override func setupViews(for view: UIView) {
        super.setupViews(for: view)

        label = Label(style: .default)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.topAnchor.constraint(equalTo: view.topAnchor),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }

    override func update(for data: TestLabelCellData) {
        super.update(for: data)
        label.text = data.text
    }
}

struct TestLabelCellData: TableViewCellData {
    let uuid: UUID = UUID()
    var text: String?
}
