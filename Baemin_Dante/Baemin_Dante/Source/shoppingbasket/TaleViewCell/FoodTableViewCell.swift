//
//  FoodTableViewCell.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/07.
//

import UIKit



class FoodTableViewCell: UITableViewCell {

    @IBOutlet var foodName: UILabel!
    @IBOutlet var foodPrice: UILabel!
    @IBOutlet var foodTotalPrice: UILabel!
    @IBOutlet var foodCount: UILabel!
    var count = 1
    
    weak var delegate: CustomBaketDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    @IBAction func plusBtn(_ sender: UIButton) {
        reloadView()
        count += 1
        foodCount.text = "\(count)개"
        Baket.foodtotalPrice += Baket.foodPrice
        foodTotalPrice.text =  "\(Baket.foodtotalPrice)원"
        Baket.totalPrice += Baket.foodtotalPrice
    }
    @IBAction func minusBtn(_ sender: Any) {
        reloadView()
        if count < 2 {
            foodCount.textColor = .lightGray
            foodTotalPrice.text =  "\(Baket.foodPrice)원"
        } else if count > 1 {
            foodCount.textColor = .black
            count -= 1
            foodCount.text = "\(count)개"
            Baket.foodtotalPrice -= Baket.foodPrice
            foodTotalPrice.text =  "\(Baket.foodtotalPrice)원"
            Baket.totalPrice -= Baket.foodtotalPrice
        }
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension FoodTableViewCell: CustomBaketDelegate {
    func pastView() {
        delegate?.pastView()
        
    }
    func reloadView() {
        delegate?.reloadView()
        
    }
}
