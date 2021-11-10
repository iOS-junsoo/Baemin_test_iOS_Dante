//
//  SettingViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/10.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        setUpTableView()
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
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "contourTableViewCell", bundle: nil), forCellReuseIdentifier: "contourTableViewCell") //nib 파일 등록
        tableView.register(UINib(nibName: "SettingTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingTableViewCell") //nib 파일 등록
        tableView.register(UINib(nibName: "BCTableViewCell", bundle: nil), forCellReuseIdentifier: "BCTableViewCell") //nib
    }

}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //cell의 갯수 설정
        return 14
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //cell의 데이터 구성
        
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "contourTableViewCell", for: indexPath) as! contourTableViewCell
            cell.selectionStyle = .none
            return cell

        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
            cell.titleLabel.text = "이벤트 혜택"
            cell.swit.isOn = true
            cell.selectionStyle = .none
            return cell
            
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
            cell.titleLabel.text = "리뷰 쓰기"
            cell.swit.isOn = true
            cell.selectionStyle = .none
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
            cell.titleLabel.text = "리뷰 댓글"
            cell.swit.isOn = true
            cell.selectionStyle = .none
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
            cell.titleLabel.text = "배달현황"
            cell.swit.isOn = true
            cell.selectionStyle = .none
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
            cell.titleLabel.text = "라이브 방송 시작"
            cell.swit.isOn = true
            cell.selectionStyle = .none
            return cell

        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "contourTableViewCell", for: indexPath) as! contourTableViewCell
            cell.selectionStyle = .none
            return cell
            
            
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
            cell.titleLabel.text = "가계번호 자동저장"
            cell.swit.isOn = false
            cell.selectionStyle = .none
            return cell
            
        case 8:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
            cell.titleLabel.text = "여러 기기에서 로그인 허용"
            cell.selectionStyle = .none
            cell.swit.isOn = false
            return cell
        case 9:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
            cell.titleLabel.text = "안심번호 항상 사용"
            cell.swit.isOn = true
            cell.selectionStyle = .none
            return cell
        
        case 10:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
            cell.titleLabel.text = "내 주문 횟수를 가게에 제공"
            cell.selectionStyle = .none
            cell.swit.isOn = false
            return cell
        case 11:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
            cell.titleLabel.text = "개인정보 수집 이용 동의(선택)"
            cell.swit.isOn = true
            cell.selectionStyle = .none
            return cell
            
            
        case 12:
            let cell = tableView.dequeueReusableCell(withIdentifier: "contourTableViewCell", for: indexPath) as! contourTableViewCell
            cell.selectionStyle = .none
            return cell
            
        case 13:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BCTableViewCell", for: indexPath) as! BCTableViewCell
            cell.titleLabel.text = "오픈소스 라이선스 확인하기"
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
        case 1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 13:
            return 60
        case 6, 12:
            return 10
       
        
        default:
            return 0

        }
    
  
    
    }
}
