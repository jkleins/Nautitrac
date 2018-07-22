//
//  LogEntryTableViewCell.swift
//  Nautitrac
//
//  Created by James Kleinschmidt on 7/22/18.
//  Copyright © 2018 Seven Bends Software. All rights reserved.
//

import UIKit

class LogEntryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logEntryTitle: UILabel!
    @IBOutlet weak var logEntryDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
