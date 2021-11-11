//
//  BPTableViewCell.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/11.
//

import UIKit

class BPTableViewCell: UITableViewCell {

    @IBOutlet var deliveryComplete: UILabel!
    @IBOutlet var imageName: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageName.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
