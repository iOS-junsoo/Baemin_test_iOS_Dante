//
//  MyBeaminViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/10/31.
//

import UIKit

class MyBeaminViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - navigationbar back button hide
        self.navigationItem.setHidesBackButton(true, animated: true)
        setUpTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    @IBAction func backBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MyFirstTableViewCell", bundle: nil), forCellReuseIdentifier: "MyFirstTableViewCell") //nib 파일 등록
        tableView.register(UINib(nibName: "MySecondTableViewCell", bundle: nil), forCellReuseIdentifier: "MySecondTableViewCell") //nib 파일 등록
        tableView.register(UINib(nibName: "MyThirdTableViewCell", bundle: nil), forCellReuseIdentifier: "MyThirdTableViewCell") //nib 파일 등록
        tableView.register(UINib(nibName: "MyFourthTableViewCell", bundle: nil), forCellReuseIdentifier: "MyFourthTableViewCell") //nib 파일 등록
        tableView.register(UINib(nibName: "MyFifthTableViewCell", bundle: nil), forCellReuseIdentifier: "MyFifthTableViewCell") //nib 파일 등록
        tableView.register(UINib(nibName: "MySixthTableViewCell", bundle: nil), forCellReuseIdentifier: "MySixthTableViewCell") //ni파일 등록
        tableView.register(UINib(nibName: "contourTableViewCell", bundle: nil), forCellReuseIdentifier: "contourTableViewCell") //nib 파일 등
    }
    
    

}
extension MyBeaminViewController: UITableViewDelegate, UITableViewDataSource {
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //cell의 갯수 설정
        return 16
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //cell의 데이터 구성
        
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "contourTableViewCell", for: indexPath) as! contourTableViewCell
            cell.selectionStyle = .none
            return cell

        case 1:
            //로그인 하면 달라져야함.
            if LoginCheckModel.loginCheck == true { //회원가입 또는 로그인 완료
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyFirstTableViewCell", for: indexPath) as! MyFirstTableViewCell
                cell.idLabel.text = "\(LoginSeverResponse.ResponseNickName)"//사용자 닉네임
                cell.loginLable.text = "고마운분,"
                cell.selectionStyle = .none
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyFirstTableViewCell", for: indexPath) as! MyFirstTableViewCell
                cell.idLabel.text = ""
                cell.loginLable.text = "로그인해주세요"
                cell.selectionStyle = .none
                return cell
            }
            
            
        case 2:
            if LoginCheckModel.loginCheck == true {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MySecondTableViewCell", for: indexPath) as! MySecondTableViewCell
                cell.selectionStyle = .none
                return cell
            } else {
                return UITableViewCell()
            }
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyThirdTableViewCell", for: indexPath) as! MyThirdTableViewCell
            cell.selectionStyle = .none
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "contourTableViewCell", for: indexPath) as! contourTableViewCell
            cell.selectionStyle = .none
            return cell

        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyFourthTableViewCell", for: indexPath) as! MyFourthTableViewCell
            cell.selectionStyle = .none
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyFifthTableViewCell", for: indexPath) as! MyFifthTableViewCell
            cell.selectionStyle = .none
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: "contourTableViewCell", for: indexPath) as! contourTableViewCell
            cell.selectionStyle = .none
            return cell

        case 8:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MySixthTableViewCell", for: indexPath) as! MySixthTableViewCell
            cell.titleLabel.text = "가족계정 관리"
            cell.selectionStyle = .none
            return cell
        case 9:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MySixthTableViewCell", for: indexPath) as! MySixthTableViewCell
            cell.titleLabel.text = "공지사항"
            cell.selectionStyle = .none
            return cell
        case 10:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MySixthTableViewCell", for: indexPath) as! MySixthTableViewCell
            cell.titleLabel.text = "배민커넥트 지원"
            cell.selectionStyle = .none
            return cell
        case 11:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MySixthTableViewCell", for: indexPath) as! MySixthTableViewCell
            cell.titleLabel.text = "이벤트"
            cell.selectionStyle = .none
            return cell
        case 12:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MySixthTableViewCell", for: indexPath) as! MySixthTableViewCell
            cell.titleLabel.text = "고객센터"
            cell.selectionStyle = .none
            return cell
        case 13:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MySixthTableViewCell", for: indexPath) as! MySixthTableViewCell
            cell.titleLabel.text = "환경설정"
            cell.selectionStyle = .none
            return cell
        case 14:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MySixthTableViewCell", for: indexPath) as! MySixthTableViewCell
            cell.titleLabel.text = "약관 및 정책"
            cell.selectionStyle = .none
            return cell
        case 15:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MySixthTableViewCell", for: indexPath) as! MySixthTableViewCell
            cell.titleLabel.text = "현재 버전 11.10.0"
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()

        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { //cell의 높이 설정

        switch indexPath.row {
        case 0:
            return 10
        case 1:
            return 84
        case 2:
            if LoginCheckModel.loginCheck == true {
                return 58
            } else {
                return 0
            }
            
        case 3:
            return 160
        case 4:
            return 10
        case 5:
            return 74
        case 6:
            return 74
        case 7:
            return 10
        case 8:
            return 60
        case 9:
            return 60
        case 10:
            return 60
        case 11:
            return 60
        case 12:
            return 60
        case 13:
            return 60
        case 14:
            return 60
        case 15:
            return 60
        default:
            return 0

        }
    
  
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 1{ //추후 로그인을 했을 때 안했을 때 넘어가는 VC가 다르게 만들어야함
            
            if LoginCheckModel.loginCheck == true {
                let alStoryboard = UIStoryboard(name: "EditMyStoryboard", bundle: nil) //스토리보드 결정
                let alarmVC = alStoryboard.instantiateViewController(identifier: "EditMyViewController")
                self.navigationController?.pushViewController(alarmVC, animated: true)

                
            } else {
                let alStoryboard = UIStoryboard(name: "LoginStoryboard", bundle: nil) //스토리보드 결정
                let alarmVC = alStoryboard.instantiateViewController(identifier: "LoginViewController")
                alarmVC.modalPresentationStyle = .fullScreen
                self.present(alarmVC, animated: true, completion: nil)
                //                guard let naviVC = self.storyboard?.instantiateViewController(withIdentifier: "naviViewController") as? naviViewController else{ return }
                //                naviVC.modalTransitionStyle = .coverVertical
                //                naviVC.modalPresentationStyle = .formSheet
                //                self.present(naviVC, animated: true, completion: nil)
            }
        
        }
    }
}


extension MyBeaminViewController {
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

//"id_email" : "tes12312t@naver.com",
//"password" : "qweasdzxc1234"
//}
