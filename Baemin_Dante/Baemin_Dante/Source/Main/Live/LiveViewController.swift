//
//  LiveViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/04.
//

import UIKit
import Gifu

class LiveViewController: UIViewController {

    @IBOutlet var gifImageView: GIFImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        Page.pageTitle2 = 3
        gifImageView.animate(withGIFNamed: "라이브") {
            print("It's animating!")
        }
        //MARK: - navigationbar back button hide
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationController?.setNavigationBarHidden(true, animated: animated)
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            self.navigationController?.setNavigationBarHidden(false, animated: animated)
        }

    @IBAction func backBtn(_ sender: UIButton) {
            self.navigationController?.popToRootViewController(animated: true)
        }

}
