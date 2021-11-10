//
//  NoticeTableViewCell.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/10.
//

import UIKit

class NoticeTableViewCell: UITableViewCell {

    @IBOutlet var noticeTitleLabel: UILabel!
    @IBOutlet var noticeDayLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
