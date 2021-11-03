//
//  findViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/10/30.
//

import UIKit

class findLocationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
