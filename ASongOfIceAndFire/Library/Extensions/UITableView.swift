//
//  UITableView.swift
//
//

import UIKit

public extension UITableView {

    func registerNib(cellType: UITableViewCell.Type) {
        register(UINib(nibName: cellType.nameOfClass, bundle: nil), forCellReuseIdentifier: cellType.nameOfClass)
    }
}
