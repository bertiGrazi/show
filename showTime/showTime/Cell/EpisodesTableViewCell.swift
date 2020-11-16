//
//  EpisodesTableViewCell.swift
//  showTime
//
//  Created by Grazi Berti on 14/11/20.
//

import UIKit

class EpisodesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var labelNameEpisode: UILabel!
    @IBOutlet weak var labelResumoEpisode: UILabel!
    
    func setup(episodeShow: Episodes){
        
        labelNameEpisode.text = episodeShow.name
        labelResumoEpisode.text = episodeShow.summary
        
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
