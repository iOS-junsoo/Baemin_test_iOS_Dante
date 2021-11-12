//
//  InformationViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/08.
//

import UIKit

class InformationViewController: UIViewController {

    @IBOutlet var name: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var rest: UILabel!
    @IBOutlet var phone: UILabel!
    @IBOutlet var Area: UILabel!
    @IBOutlet var order: UILabel!
    @IBOutlet var review: UILabel!
    @IBOutlet var Jjim: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        InfoRequest().getData()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
            print("1111인포")
            self.info()
        }
    }
    

    func info() {
        Jjim.text = "\(CNDataModel.restaurantJjim)"
        name.text = InfoDataModel.Info.business_name
        time.text = InfoDataModel.Info.operation_time
        rest.text = InfoDataModel.Info.holiday
        phone.text = InfoDataModel.Info.phone_number
        Area.text = InfoDataModel.Info.delivery_area
        review.text = "\(InfoDataModel.Info.recent_order_ten!)+"
        order.text = "\(InfoDataModel.Info.total_review_ten!)+"
        
    }

}
