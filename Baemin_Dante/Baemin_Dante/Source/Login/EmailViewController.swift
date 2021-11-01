//
//  EmailViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/01.
//

import UIKit

class EmailViewController: UIViewController {

    @IBOutlet var jungbokBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jungbokBtn.layer.cornerRadius = 2
        jungbokBtn.layer.borderWidth = 0.3
        jungbokBtn.layer.borderColor = UIColor.gray.cgColor
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
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
