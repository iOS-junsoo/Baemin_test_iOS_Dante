//
//  SearchViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/04.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
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

