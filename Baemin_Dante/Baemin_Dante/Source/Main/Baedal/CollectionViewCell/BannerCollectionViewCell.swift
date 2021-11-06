//
//  BannerCollectionViewCell.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/05.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func configure(with model: Model) {
        self.imageBtn.setImage(UIImage(named: model.imageName), for: .normal)
    }
}
