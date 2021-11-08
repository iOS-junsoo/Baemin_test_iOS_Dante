//
//  TotalTableViewCell.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/07.
//

import UIKit

class TotalTableViewCell: UITableViewCell {

    @IBOutlet var totalPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        totalPrice.text = "\(Baket.totalPrice)원"
        print(Baket.totalPrice)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
