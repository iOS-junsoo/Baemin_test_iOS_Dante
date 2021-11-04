//
//  firstTableViewCell.swift
//  Tableview-Baemin_Demo
//
//  Created by 준수김 on 2021/11/02.
//

import UIKit

class firstTableViewCell: UITableViewCell {

    @IBOutlet weak var baeminView: UIView!
    @IBOutlet weak var searchBtn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        baeminView.layer.cornerRadius = 18
        searchBtn.layer.cornerRadius = 2
        searchBtn.layer.shadowColor = UIColor.black.cgColor // 색깔
        searchBtn.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        searchBtn.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        searchBtn.layer.shadowRadius = 5 // 반경
        searchBtn.layer.shadowOpacity = 0.1 // alpha값
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func searchBarTap(_ sender: UIButton) {
//        let myStoryboard = UIStoryboard(name: "SearchViewController", bundle: nil) //스토리보드 결정
//        let myBeaminVC = myStoryboard.instantiateViewController(identifier: "SearchViewController")
//        self.navigationController?.pushViewController(myBeaminVC, animated: true)
//        print("search")
    }
    
    
    
}
