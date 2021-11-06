//
//  KoreaFoodViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/06.
//

import UIKit

class KoreaFoodViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - 네비게이션 바 Title 바꾸기
        
        //MARK: - navigationbar back button hide
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
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
