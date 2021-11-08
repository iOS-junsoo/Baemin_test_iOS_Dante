//
//  RadioTableViewCell.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/07.
//

import UIKit




class RadioTableViewCell: UITableViewCell {
    @IBOutlet var baedalBtn: UIButton!
    @IBOutlet var PojangBtn: UIButton!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func BaedalBtn(_ sender: Any) {
        baedalBtn.tintColor = hexStringToUIColor(hex: "2BC1BD")
        PojangBtn.tintColor = hexStringToUIColor(hex: "#A3A3A3")
    }
    
    @IBAction func PojangBtn(_ sender: Any) {
        
        PojangBtn.tintColor = hexStringToUIColor(hex: "2BC1BD")
        baedalBtn.tintColor = hexStringToUIColor(hex: "#A3A3A3")
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension RadioTableViewCell {
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
