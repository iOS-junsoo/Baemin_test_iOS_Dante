//
//  InsideMenuViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/11.
//

import UIKit

class InsideMenuViewController: UIViewController {

    @IBOutlet var myView: UIView!
    @IBOutlet var myView2: UIView!
    @IBOutlet var j1: UIButton!
    @IBOutlet var j2: UIButton!
    @IBOutlet var j3: UIButton!
    @IBOutlet var j4: UIButton!
    @IBOutlet var c1: UIButton!
    @IBOutlet var c2: UIButton!
    @IBOutlet var c3: UIButton!
    @IBOutlet var c4: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        myView.layer.shadowColor = UIColor.black.cgColor // 색깔
        myView.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        myView.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        myView.layer.shadowRadius = 5 // 반경
        myView.layer.shadowOpacity = 0.3 // alpha값
        
        myView2.layer.shadowColor = UIColor.black.cgColor // 색깔
        myView2.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        myView2.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        myView2.layer.shadowRadius = 5 // 반경
        myView2.layer.shadowOpacity = 0.3 // alpha값
    }
    @IBAction func j1(_ sender: Any) {
        j2.tintColor = .lightGray
        j3.tintColor = .lightGray
        j4.tintColor = .lightGray
    }
    @IBAction func j2(_ sender: Any) {
        j1.tintColor = .lightGray
        j3.tintColor = .lightGray
        j4.tintColor = .lightGray
    }
    @IBAction func j3(_ sender: Any) {
        j2.tintColor = .lightGray
        j1.tintColor = .lightGray
        j4.tintColor = .lightGray
    }
    @IBAction func j4(_ sender: Any) {
        j2.tintColor = .lightGray
        j3.tintColor = .lightGray
        j1.tintColor = .lightGray
    }
    @IBAction func c1(_ sender: Any) {
        c2.tintColor = .lightGray
        c3.tintColor = .lightGray
        c4.tintColor = .lightGray
    }
    @IBAction func c2(_ sender: Any) {
        c1.tintColor = .lightGray
        c3.tintColor = .lightGray
        c4.tintColor = .lightGray
    }
    @IBAction func c3(_ sender: Any) {
        c2.tintColor = .lightGray
        c1.tintColor = .lightGray
        c4.tintColor = .lightGray
    }
    @IBAction func c4(_ sender: Any) {
        c2.tintColor = .lightGray
        c3.tintColor = .lightGray
        c1.tintColor = .lightGray
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationController?.setNavigationBarHidden(true, animated: animated)
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            self.navigationController?.setNavigationBarHidden(false, animated: animated)
        }
    
    

}
