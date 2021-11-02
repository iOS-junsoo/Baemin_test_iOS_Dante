//
//  secondCollectionViewCell.swift
//  Tableview-Baemin_Demo
//
//  Created by 준수김 on 2021/11/02.
//

import UIKit

class secondCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageBtn.adjustsImageWhenHighlighted = false
    }
    
    public func configure(with model2: Model2) {
        self.imageBtn.setImage(UIImage(named: model2.imageName), for: .normal)
    }

}
