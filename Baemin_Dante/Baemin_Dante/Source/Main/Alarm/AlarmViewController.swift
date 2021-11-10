//
//  SearchBarViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/10/31.
//

import UIKit
import Gifu

class AlarmViewController: UIViewController {
    @IBOutlet var gifImageView: GIFImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        gifImageView.animate(withGIFNamed: "알람센터") {
            print("It's animating!")
        }
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
        self.navigationController?.popViewController(animated: true)
//    dismiss(animated: true, completion: nil)
    }

}
