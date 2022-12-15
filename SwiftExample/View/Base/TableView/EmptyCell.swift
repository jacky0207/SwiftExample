//
//  EmptyCell.swift
//  SwiftExample
//
//  Created by Jacky Lam on 29/11/2022.
//

import Foundation

final class EmptyCell: TableViewCell<EmptyCellData> {

}

struct EmptyCellData: TableViewCellData {
    let uuid: UUID = UUID()
}
