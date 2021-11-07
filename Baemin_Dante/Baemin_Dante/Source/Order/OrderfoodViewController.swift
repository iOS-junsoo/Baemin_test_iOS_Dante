//
//  OrderViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/07.
//

import UIKit

class OrderfoodViewController: UIViewController {

    @IBOutlet var myView2: UIView!
    @IBOutlet var myView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //View에 그림자
       myView.layer.shadowColor = UIColor.black.cgColor // 색깔
       myView.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
       myView.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
       myView.layer.shadowRadius = 5 // 반경
       myView.layer.shadowOpacity = 0.1 // alpha값
//        myView2.layer.shadowColor = UIColor.black.cgColor // 색깔
//        myView2.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
//        myView2.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
//        myView2.layer.shadowRadius = 5 // 반경
//        myView2.layer.shadowOpacity = 0.3 // alpha값
        
        //MARK: - navigationbar back button hide
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
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
        self.navigationController?.popViewController(animated: true)
    }

}
