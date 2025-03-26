//
//  wholeFamilyTableViewCustomCell.swift
//  Family Introduction
//
//  Created by Samuel Bradshaw  on 3/26/25.
//

import UIKit

class wholeFamilyTableViewCustomCell: UITableViewCell {

    @IBOutlet var familyMemberImage: UIImageView!
    @IBOutlet var labelView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func assignFamilyMember(family: FamilyMember) {
        
        familyMemberImage.image = UIImage(named: family.pictures[0])
        labelView.text = family.name
    }

}
