//
//  CustomPostTableViewCell.swift
//  Tech Social Media App
//
//  Created by Samuel Bradshaw  on 4/1/25.
//

import UIKit

class CustomPostTableViewCell: UITableViewCell {

    @IBOutlet var TitleLabel: UILabel!
    @IBOutlet var postImage: UIImageView!
    @IBOutlet var bodyTextLabel: UILabel!
    @IBOutlet var commentsLabel: UILabel!
    @IBOutlet var userLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func assignPostInformation(post: Post) {
        TitleLabel.text = post.title
        postImage.image = UIImage(named: post.image)
        bodyTextLabel.text = " \(post.user): \(post.bodyText)"
        commentsLabel.text = " \(post.follower): \(post.comments)"
        userLabel.text = post.user
        dateLabel.text = post.date
    }

}
