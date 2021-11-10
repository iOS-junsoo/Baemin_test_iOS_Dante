//
//  GradeViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/10.
//

import UIKit

class GradeViewController: UIViewController {

    @IBOutlet var nickName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nickName.text = LoginSeverResponse.ResponseNickName
        self.navigationItem.setHidesBackButton(true, animated: true)
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
//        self.navigationController?.popViewController(animated: true)
    dismiss(animated: true, completion: nil)
    }

}
