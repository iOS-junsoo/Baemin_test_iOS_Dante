//
//  TodayCollectionViewCell.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/05.
//

import UIKit

class TodayCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageBtn.adjustsImageWhenHighlighted = false
    }
    public func configure(with model2: Model2) {
        self.imageBtn.setImage(UIImage(named: model2.imageName), for: .normal)
    }
}
