//
//  LocalViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/10/30.
//

import UIKit

class LocalViewController: UIViewController {

    @IBOutlet weak var findBtn: UIButton!
    @IBOutlet weak var nowBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        //MARK: - 버튼클릭시 회색으로 변하는 거 없애기
        findBtn.adjustsImageWhenHighlighted = false
        nowBtn.adjustsImageWhenHighlighted = false
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

