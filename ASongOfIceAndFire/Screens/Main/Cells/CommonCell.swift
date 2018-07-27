//
//  CommonCell.swift
//  ASongOfIceAndFire
//
//  Created by Nastya on 23.07.2018.
//  Copyright © 2018 Nastya. All rights reserved.
//

import UIKit

class CommonCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet fileprivate weak var name: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(value: String) {
        name.text = value
    }

}
