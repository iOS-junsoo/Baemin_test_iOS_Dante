//
//  bottomTableViewCell.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/09.
//

import UIKit

class bottomTableViewCell: UITableViewCell {

    @IBOutlet var foodName: UILabel!
    @IBOutlet var foodPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
