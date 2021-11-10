//
//  TotalSearviceViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/10/31.
//

import UIKit

class TotalSearviceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - navigationbar back button hide
        self.navigationItem.setHidesBackButton(true, animated: true)
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

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Hansick(_ sender: Any) {
        let alStoryboard = UIStoryboard(name: "Paging2Storyboard", bundle: nil) //스토리보드 결정
                let alarmVC = alStoryboard.instantiateViewController(identifier: "Paging2ViewController")
                self.navigationController?.pushViewController(alarmVC, animated: true)
    }
    @IBAction func Home(_ sender: Any) {
        let alStoryboard = UIStoryboard(name: "PagingStoryboard", bundle: nil) //스토리보드 결정
                let alarmVC = alStoryboard.instantiateViewController(identifier: "PagingViewController")
                self.navigationController?.pushViewController(alarmVC, animated: true)
    }
    
}
