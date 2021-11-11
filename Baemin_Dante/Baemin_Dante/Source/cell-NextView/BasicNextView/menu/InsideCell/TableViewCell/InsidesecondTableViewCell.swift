//
//  InsidesecondTableViewCell.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/11.
//

import UIKit

class InsidesecondTableViewCell: UITableViewCell {

    @IBOutlet var OptionTitle: UILabel!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var foodOption1: UILabel!
    @IBOutlet var foodOption2: UILabel!
    @IBOutlet var foodOption3: UILabel!
    @IBOutlet var foodOption4: UILabel!
    @IBOutlet var foodOptionPrice1: UILabel!
    @IBOutlet var foodOptionPrice2: UILabel!
    @IBOutlet var foodOptionPrice3: UILabel!
    @IBOutlet var foodOptionPrice4: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func j1(_ sender: Any) {
        button1.tintColor = hexStringToUIColor(hex: "#2BC1BD")
        button2.tintColor = .lightGray
        button3.tintColor = .lightGray
        button4.tintColor = .lightGray
    }
    @IBAction func j2(_ sender: Any) {
        button1.tintColor = .lightGray
        button2.tintColor = hexStringToUIColor(hex: "#2BC1BD")
        button3.tintColor = .lightGray
        button4.tintColor = .lightGray
    }
    @IBAction func j3(_ sender: Any) {
        button2.tintColor = .lightGray
        button1.tintColor = .lightGray
        button3.tintColor = hexStringToUIColor(hex: "#2BC1BD")
        button4.tintColor = .lightGray
    }
    @IBAction func j4(_ sender: Any) {
        button2.tintColor = .lightGray
        button3.tintColor = .lightGray
        button1.tintColor = .lightGray
        button4.tintColor = hexStringToUIColor(hex: "#2BC1BD")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension InsidesecondTableViewCell {
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
