//
//  topTableViewCell.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/09.
//

import UIKit

class topTableViewCell: UITableViewCell {

    @IBOutlet var foodName: UILabel!
    @IBOutlet var foodDetail: UILabel!
    @IBOutlet var foodPrice: UILabel!
    @IBOutlet var foodImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
       foodImage.layer.cornerRadius = 5
       foodImage.clipsToBounds = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
