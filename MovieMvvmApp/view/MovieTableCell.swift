//
//  MovieTableCell.swift
//  MovieMvvmApp
//
//  Created by Xiaolue Peng on 3/15/20.
//  Copyright © 2020 xiaoluepeng. All rights reserved.
//

import UIKit

class MovieTableCell: UITableViewCell {

    
    @IBOutlet weak var movieLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
