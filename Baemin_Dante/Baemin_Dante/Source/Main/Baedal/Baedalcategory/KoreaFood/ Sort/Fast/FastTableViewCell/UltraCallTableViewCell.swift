//
//  UltraCallTableViewCell.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/07.
//

import UIKit

class UltraCallTableViewCell: UITableViewCell {

    @IBOutlet var imagName: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var star: UILabel!
    @IBOutlet var review: UILabel!
    @IBOutlet var menu: UILabel!
    @IBOutlet var orderPay: UILabel!
    @IBOutlet var deliveryPay: UILabel!
    @IBOutlet var orderTime: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
