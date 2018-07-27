//
//  BookCell.swift
//  ASongOfIceAndFire
//
//  Created by Nastya on 23.07.2018.
//  Copyright © 2018 Nastya. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet fileprivate weak var authorLabel: UILabel!
    @IBOutlet fileprivate weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(book: Book) {
        if let val = book.authors?.first {
            authorLabel.text = val
        }
        nameLabel.text = book.name
    }

    
}
