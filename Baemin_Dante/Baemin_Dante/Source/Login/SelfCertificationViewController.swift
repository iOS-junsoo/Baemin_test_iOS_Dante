//
//  SelfCertificationViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/10/31.
//

import UIKit

class SelfCertificationViewController: UIViewController {

    @IBOutlet var phoneBtn: UIButton!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var pheneCheckImage: UIImageView!
    @IBOutlet var numberCheckImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneBtn.layer.borderWidth = 0.3
        phoneBtn.layer.borderColor = UIColor.gray.cgColor
//        phoneBtn.tintColor = UIColor.black
    }
    //MARK: - 네비게이션 바 없애기
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    

    @IBAction func backBtn(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func nextBtn(_ sender: UIButton) {
        if let emailVC = self.storyboard?.instantiateViewController(withIdentifier: "EmailViewController") as? EmailViewController {
        self.navigationController?.pushViewController(emailVC, animated: true)
        }
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
