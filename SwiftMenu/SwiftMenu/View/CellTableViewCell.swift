//
//  CellTableViewCell.swift
//  SwiftMenu
//
//  Created by Bryan A Bolivar M on 5/9/15.
//  Copyright (c) 2015 Bolivar. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var details: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
