//
//  CustomPlayerTableViewCell.swift
//  Game Tracker
//
//  Created by Samuel Bradshaw  on 4/7/25.
//

import UIKit
protocol CustomPlayerTableViewCellDelegate {
    func sortPlayerScore()
}

class CustomPlayerTableViewCell: UITableViewCell {

    var delegate: CustomPlayerTableViewCellDelegate?
    var player: Player?
    @IBOutlet var profilePicture: UIImageView!
    @IBOutlet var playerNameLabel: UILabel!
    @IBOutlet var playerScoreLabel: UILabel!
    @IBOutlet var stepper: UIStepper!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        player?.score = Int(stepper.value)
        playerScoreLabel.text = String(player?.score ?? 0)
        delegate?.sortPlayerScore()
    }
    
    func assignPlayerInformation(player: Player) {
        self.player = player
        profilePicture.image = UIImage(systemName: player.picture)
        playerNameLabel.text = player.name
        playerScoreLabel.text = String(player.score)
        stepper.value = Double(player.score)
        
    }

}
