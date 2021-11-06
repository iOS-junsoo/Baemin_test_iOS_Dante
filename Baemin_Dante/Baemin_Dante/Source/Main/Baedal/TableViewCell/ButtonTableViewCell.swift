//
//  ButtonTableViewCell.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/05.
//

import UIKit

protocol ButtonDelegate: class {
    func nextView()
}

class ButtonTableViewCell: UITableViewCell {

    weak var delegate: ButtonDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func KoreaFoodBtnTap(_ sender: UIButton) {
        nextView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension ButtonTableViewCell: ButtonDelegate {
    func nextView() {
        delegate?.nextView()
        
    }
}
