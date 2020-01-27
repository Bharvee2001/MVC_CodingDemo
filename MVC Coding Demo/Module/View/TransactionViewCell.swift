//
//  TransactionViewCell.swift
//  MVC Coding Demo
//
//  Created by bharvee_parmar on 27/01/20.
//  Copyright © 2020 bharvee_parmar. All rights reserved.
//

import UIKit

class TransactionViewCell: UITableViewCell {
    @IBOutlet var subTypeLabel: UILabel!
    
    @IBOutlet var typeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func prepareData(modal : TransactionHistory) {
        if let type = modal.type {
            typeLabel.text = type
        }
        if let subType = modal.subType {
            subTypeLabel.text = subType
        }
    }
}
