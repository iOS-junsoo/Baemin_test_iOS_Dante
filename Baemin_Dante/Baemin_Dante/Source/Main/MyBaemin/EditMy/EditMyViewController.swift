//
//  EditMyViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/09.
//

import UIKit

class EditMyViewController: UIViewController {

    @IBOutlet var switch1: UISwitch!
    @IBOutlet var switch2: UISwitch!
    @IBOutlet var nickNameTF: UITextField!
    @IBOutlet var emailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        switch1.onTintColor = hexStringToUIColor(hex: "#2DC0BD")
        switch2.onTintColor = hexStringToUIColor(hex: "#2DC0BD")
        MBRequest().getData()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
            self.nickNameTF.text = MBDataModel.MBNickName
            self.emailLabel.text = MBDataModel.MBEmail
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func logoutBtnTap(_ sender: UIButton) {
        LoginCheckModel.loginCheck = false
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension EditMyViewController {
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}
