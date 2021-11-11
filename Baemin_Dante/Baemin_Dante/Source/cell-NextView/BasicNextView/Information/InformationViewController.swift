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
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            self.info()
        }
    }
    

    func info() {
        Jjim.text = "\(CNDataModel.restaurantJjim)"
        
        
        
    }

}
