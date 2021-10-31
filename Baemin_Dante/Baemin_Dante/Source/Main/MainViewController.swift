//
//  ViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/10/30.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var baeminView: UIView!
    @IBOutlet var searchBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - 바 버튼 아이템 간격조절
        //이미지 생성
        var alarmImage = UIImage(named: "홈_오른쪽버튼1")
        var myBaeminImage = UIImage(named: "홈_오른쪽버튼2")
        //버튼 생성
        let alarmButton: UIButton = UIButton.init(type: .custom)
        alarmButton.setImage(alarmImage, for: .normal)
        alarmButton.addTarget(self, action: #selector(didTapAlarmBtn), for: .touchUpInside)
        alarmButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let barAlarmButton = UIBarButtonItem(customView: alarmButton)
        
        let myBaeminButton: UIButton = UIButton.init(type: .custom)
        myBaeminButton.setImage(myBaeminImage, for: .normal)
        myBaeminButton.addTarget(self, action: #selector(didTapmyBaeminBtn), for: .touchUpInside)
        myBaeminButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        myBaeminButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let barMyBaeminButton = UIBarButtonItem(customView: myBaeminButton)
        //바 버튼 추가
       
        self.navigationItem.setRightBarButtonItems([barMyBaeminButton, barAlarmButton], animated: false)
        
        //MARK: - 버튼 눌림 안보이게
        searchBtn.adjustsImageWhenHighlighted = false
        
        //MARK: - View 둥글게 / 그림자
        baeminView.layer.cornerRadius = 18
        searchBtn.layer.shadowColor = UIColor.black.cgColor // 색깔
        searchBtn.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        searchBtn.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        searchBtn.layer.shadowRadius = 5 // 반경
        searchBtn.layer.shadowOpacity = 0.1 // alpha값
        
        //MARK: - 네이게이션바 색
//        self.navigationController?.navigationBar.backgroundColor = self.hexStringToUIColor(hex: "2DC0BD")
//        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        //MARK: - 네비게이션바에 버튼 삽입하기
        let button =  UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15.0, weight: .bold) //버튼 폰트
        button.setTitle(Location.titleLocation, for: .normal)
        button.addTarget(self, action: #selector(clickOnButton), for: .touchUpInside)
        navigationItem.titleView = button
        
    }
    
    @objc func clickOnButton() {
        print("click")
    }
    
    @objc func didTapAlarmBtn() {
        let alStoryboard = UIStoryboard(name: "AlarmStoryboard", bundle: nil) //스토리보드 결정
        let alarmVC = alStoryboard.instantiateViewController(identifier: "AlarmViewController")
        self.navigationController?.pushViewController(alarmVC, animated: true)
    }
    
    @objc func didTapmyBaeminBtn() {
        //MARK: - 네이비게이션 컨트롤러를 이용해서 화면전환
        let myStoryboard = UIStoryboard(name: "MyBeaminStoryboard", bundle: nil) //스토리보드 결정
        let myBeaminVC = myStoryboard.instantiateViewController(identifier: "MyBeaminViewController")
        self.navigationController?.pushViewController(myBeaminVC, animated: true)
    }
    
}

//MARK: - hex Color
extension MainViewController {
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
