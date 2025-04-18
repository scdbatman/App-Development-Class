//
//  CustomGameTableViewCell.swift
//  Game Tracker
//
//  Created by Samuel Bradshaw  on 4/10/25.
//

import UIKit
protocol CustomGameTableViewCellDelegate {
    
}
class CustomGameTableViewCell: UITableViewCell {

    var delegate: CustomGameTableViewCellDelegate?
    var game: Game?
    @IBOutlet var gameNameLabel: UILabel!
    @IBOutlet var currentWinnerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func assignGameInfo(game: Game) {
        gameNameLabel.text = game.name
        currentWinnerLabel.text = game.currentWinner
    }
    
    

}
