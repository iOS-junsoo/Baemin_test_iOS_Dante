//
//  thirdOrderTableViewCell.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/09.
//

import UIKit

class thirdOrderTableViewCell: UITableViewCell {

    @IBOutlet var baeminPay: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        baeminPay.layer.cornerRadius = 5
        baeminPay.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
