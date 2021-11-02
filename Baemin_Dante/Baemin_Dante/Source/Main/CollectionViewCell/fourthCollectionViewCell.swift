//
//  fourthCollectionViewCell.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/02.
// 우리동네 빠른 배달

import UIKit

class fourthCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet var imageBtn: UIButton!
    @IBOutlet var baeminName: UILabel!
    @IBOutlet var baeminStar: UILabel!
    @IBOutlet var baeminTip: UILabel!
    @IBOutlet var imageTime: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with model3: Model3) {
        self.imageBtn.setImage(UIImage(named: model3.imageName), for: .normal)
        self.baeminName.text = model3.baeminName
        self.baeminStar.text = model3.baeminStar
        self.baeminTip.text = model3.baeminTip
        self.imageTime.image = UIImage(named: model3.imageTime)
    }


}
