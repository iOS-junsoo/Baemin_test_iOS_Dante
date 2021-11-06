//
//  firstCollectionViewCell.swift
//  Tableview-Baemin_Demo
//
//  Created by 준수김 on 2021/11/02.
//

import UIKit

class firstCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func configure(with model: Model) {
        self.imageBtn.setImage(UIImage(named: model.imageName), for: .normal)
    }
}
