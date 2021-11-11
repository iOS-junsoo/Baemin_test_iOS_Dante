//
//  CouponViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/10.
//

import UIKit

class CouponViewController: UIViewController {

    @IBOutlet var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        btn.layer.shadowColor = UIColor.black.cgColor // 색깔
        btn.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        btn.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        btn.layer.shadowRadius = 5 // 반경
        btn.layer.shadowOpacity = 0.3 // alpha값
    }
    

    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationController?.setNavigationBarHidden(true, animated: animated)
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            self.navigationController?.setNavigationBarHidden(false, animated: animated)
        }
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true) //이전 VC로
    }

}
