//
//  ToDoCell.swift
//  List Project
//
//  Created by Samuel Bradshaw  on 4/18/25.
//

import UIKit
protocol ToDoCellDelegate: AnyObject {
    func checkMarkTapped(sender: ToDoCell)
}
class ToDoCell: UITableViewCell {
    weak var delegate: ToDoCellDelegate?
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var isComplete: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func completeButtonTapped(_ sender: UIButton) {
        delegate?.checkMarkTapped(sender: self)
    }
}
