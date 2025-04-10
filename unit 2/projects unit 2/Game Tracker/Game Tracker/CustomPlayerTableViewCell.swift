//
//  CustomPlayerTableViewCell.swift
//  Game Tracker
//
//  Created by Samuel Bradshaw  on 4/7/25.
//

import UIKit

class CustomPlayerTableViewCell: UITableViewCell {

    @IBOutlet var profilePicture: UIImageView!
    @IBOutlet var playerNameLabel: UILabel!
    @IBOutlet var playerScoreLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func stepperPressed(_ sender: Any) {
        
    }
    func assignPlayerInformation(player: Player) {
        profilePicture.image = UIImage(systemName: player.picture)
        playerNameLabel.text = player.name
        playerScoreLabel.text = player.score
    }

}
