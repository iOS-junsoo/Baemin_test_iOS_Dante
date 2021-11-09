//
//  ReviewTableViewCell.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/09.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet var userNickname: UIButton!
    @IBOutlet var userday: UILabel!
    @IBOutlet var userReview: UILabel!
    
    @IBOutlet var userMenu: UIButton!
    @IBOutlet var star1: UIImageView!
    @IBOutlet var star2: UIImageView!
    @IBOutlet var star3: UIImageView!
    @IBOutlet var star4: UIImageView!
    @IBOutlet var star5: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
