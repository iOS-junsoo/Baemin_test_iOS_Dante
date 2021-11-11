//
//  BPDetailsecondTableViewCell.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/11.
//

import UIKit

class BPDetailsecondTableViewCell: UITableViewCell {

    @IBOutlet var foodName: UILabel!
    @IBOutlet var foodPrice: UILabel!
    @IBOutlet var orderPrice: UILabel!
    @IBOutlet var deliveryTip: UILabel!
    @IBOutlet var totalPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
