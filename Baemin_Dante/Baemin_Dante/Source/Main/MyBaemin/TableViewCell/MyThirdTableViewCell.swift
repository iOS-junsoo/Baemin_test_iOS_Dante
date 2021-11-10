//
//  MyThirdTableViewCell.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/09.
//

import UIKit

protocol CustomMyBeaminDelegate: class {
    func P()
    func C()
    func S()
    func J()
    func O()
    func R()
}


class MyThirdTableViewCell: UITableViewCell {

    weak var delegate: CustomMyBeaminDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func point(_ sender: Any) {
        P()
    }
    @IBAction func coupon(_ sender: Any) {
        C()
    }
    @IBAction func gift(_ sender: Any) {
        S()
    }
    
    @IBAction func love(_ sender: Any) {
        J()
    }
    @IBAction func order(_ sender: Any) {
        O()
    }
    
    @IBAction func review(_ sender: Any) {
        R()
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MyThirdTableViewCell: CustomMyBeaminDelegate {
    func P() {
        delegate?.P()
    }
    
    func C() {
        delegate?.C()
    }
    
    func S() {
        delegate?.S()
    }
    
    func J() {
        delegate?.J()
    }
    
    func O() {
        delegate?.O()
    }
    
    func R() {
        delegate?.R()
    }
    
    
    
    
}
