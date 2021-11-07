//
//  BasicNextViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/07.
//

import UIKit

class BasicNextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - navigationbar back button hide
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        //MARK: - basket Button
        let button = UIButton(frame: CGRect(x: 285, y: 707, width: 105, height: 98))
        button.setImage(UIImage(named: "장바구니0"), for: .normal)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        
        //버튼 그림자
        button.layer.shadowColor = UIColor.black.cgColor // 색깔
        button.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        button.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        button.layer.shadowRadius = 5 // 반경
        button.layer.shadowOpacity = 0.3 // alpha값
        self.view.addSubview(button)
        
        
        
    }
    
    @objc func handleTap(_ sender: UIButton) {
        let alStoryboard = UIStoryboard(name: "BaketStoryboard", bundle: nil) //스토리보드 결정
        let alarmVC = alStoryboard.instantiateViewController(identifier: "BaketViewController")
        self.navigationController?.pushViewController(alarmVC, animated: true)
        
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
    }

}
