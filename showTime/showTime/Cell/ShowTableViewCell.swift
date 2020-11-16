//
//  ShowTableViewCell.swift
//  showTime
//
//  Created by Grazi Berti on 13/11/20.
//

import UIKit

class ShowTableViewCell: UITableViewCell {

    @IBOutlet weak var labelShowName: UILabel!
    
    func setup(showName: Show) {
        labelShowName.text = showName.name
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
