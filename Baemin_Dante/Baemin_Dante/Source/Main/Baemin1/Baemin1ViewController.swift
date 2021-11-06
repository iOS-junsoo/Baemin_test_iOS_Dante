//
//  Baemin1ViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/04.
//

import UIKit

class Baemin1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //MARK: - navigationbar back button hide
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
    }
//    override func viewDidAppear(_ animated: Bool) {
//        if PageCheck.page2Check == 0{
//            Page.pageTitle2 = 1
//            PageCheck.page2Check = 1
//        }
//    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationController?.setNavigationBarHidden(true, animated: animated)
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            self.navigationController?.setNavigationBarHidden(false, animated: animated)
        }

    @IBAction func backBtn(_ sender: UIButton) {
            self.navigationController?.popToRootViewController(animated: true)
        }

}
