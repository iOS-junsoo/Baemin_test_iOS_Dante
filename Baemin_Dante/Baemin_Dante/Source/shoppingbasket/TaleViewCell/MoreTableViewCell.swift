//
//  MoreTableViewCell.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/07.
//

import UIKit

protocol CustomBaketDelegate: class {
    func pastView()
    func reloadView()
}

class MoreTableViewCell: UITableViewCell {

    weak var delegate: CustomBaketDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func backBtn(_ sender: UIButton) {
        pastView()
        print("nib")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension MoreTableViewCell: CustomBaketDelegate {
    func pastView() {
        delegate?.pastView()
        
    }
    func reloadView() {
        delegate?.reloadView()
        
    }
}
