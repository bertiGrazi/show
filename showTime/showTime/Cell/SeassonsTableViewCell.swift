//
//  SeassonsTableViewCell.swift
//  showTime
//
//  Created by Grazi Berti on 13/11/20.
//

import UIKit

class SeassonsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var labelSeassons: UILabel!
    
    func setup(seassonShow: Seasons) {
        labelSeassons.text = seassonShow.name
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
