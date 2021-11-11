//
//  InsidefirstTableViewCell.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/11.
//

import UIKit

class InsidefirstTableViewCell: UITableViewCell {
    @IBOutlet var myView: UIView!
    @IBOutlet var foodName: UILabel!
    @IBOutlet var foodDetail: UILabel!
    @IBOutlet var foodPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        myView.layer.shadowColor = UIColor.black.cgColor // 색깔
        myView.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        myView.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        myView.layer.shadowRadius = 5 // 반경
        myView.layer.shadowOpacity = 0.3 // alpha값
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
