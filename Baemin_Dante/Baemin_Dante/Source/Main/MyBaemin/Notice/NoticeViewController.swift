//
//  NoticeViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/10.
//

import UIKit

class NoticeViewController: UIViewController {

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
        tableView.register(UINib(nibName: "NoticeTableViewCell", bundle: nil), forCellReuseIdentifier: "NoticeTableViewCell") //nib 파일 등록
        tableView.register(UINib(nibName: "contourTableViewCell", bundle: nil), forCellReuseIdentifier: "contourTableViewCell") //nib 파일 등
        
    }

}

extension NoticeViewController: UITableViewDelegate, UITableViewDataSource {
    
   
    
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell", for: indexPath) as! NoticeTableViewCell
            cell.noticeTitleLabel.text = "'방역수칙을 준수하는 안전한 외식생활 캠페인' 종료안내"
            cell.noticeDayLabel.text = "2021.11.10"
            cell.selectionStyle = .none
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell", for: indexPath) as! NoticeTableViewCell
            cell.noticeTitleLabel.text = "개인정보처리방침 개정 안내"
            cell.noticeDayLabel.text = "2021.11.08"
            cell.selectionStyle = .none
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell", for: indexPath) as! NoticeTableViewCell
            cell.noticeTitleLabel.text = "고객센터 전화상담 및 일부 서비스 중단 안내"
            cell.noticeDayLabel.text = "2021.11.05"
            cell.selectionStyle = .none
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell", for: indexPath) as! NoticeTableViewCell
            cell.noticeTitleLabel.text = "서비스 이용약관 개정 안내"
            cell.noticeDayLabel.text = "2021.11.01"
            cell.selectionStyle = .none
            return cell

        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell", for: indexPath) as! NoticeTableViewCell
            cell.noticeTitleLabel.text = "고객센터 일부 서비스 일시 중단 안내"
            cell.noticeDayLabel.text = "2021.10.22"
            cell.selectionStyle = .none
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell", for: indexPath) as! NoticeTableViewCell
            cell.noticeTitleLabel.text = "반찬안받기 이벤트 당첨자 안내"
            cell.noticeDayLabel.text = "2021.10.14"
            cell.selectionStyle = .none
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell", for: indexPath) as! NoticeTableViewCell
            cell.noticeTitleLabel.text = "개인정보처리 방침 개정 안내"
            cell.noticeDayLabel.text = "2021.10.11"
            cell.selectionStyle = .none
            return cell

        case 8:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell", for: indexPath) as! NoticeTableViewCell
            cell.noticeTitleLabel.text = "고객센터 전화상담 일시 중단 안내"
            cell.noticeDayLabel.text = "2021.10.08"
            cell.selectionStyle = .none
            return cell
        case 9:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell", for: indexPath) as! NoticeTableViewCell
            cell.noticeTitleLabel.text = "'방역수칙을 준수하는 안전한 외식생활 캠페인' 종료안내"
            cell.noticeDayLabel.text = "2021.10.08"
            cell.selectionStyle = .none
            return cell
        case 10:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell", for: indexPath) as! NoticeTableViewCell
            cell.noticeTitleLabel.text = "선불충전금 운용현황 공시"
            cell.noticeDayLabel.text = "2021.10.08"
            cell.selectionStyle = .none
            return cell
        case 11:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell", for: indexPath) as! NoticeTableViewCell
            cell.noticeTitleLabel.text = "배민페이머니 고객확인 제도 시행 안내"
            cell.noticeDayLabel.text = "2021.10.05"
            cell.selectionStyle = .none
            return cell
        case 12:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell", for: indexPath) as! NoticeTableViewCell
            cell.noticeTitleLabel.text = "VIP 월간쿠폰북  B마트 쿠폰 혜택 변경 안내"
            cell.noticeDayLabel.text = "2021.09.30"
            cell.selectionStyle = .none
            return cell
        case 13:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell", for: indexPath) as! NoticeTableViewCell
            cell.noticeTitleLabel.text = "개인정보처리방침 개정 안내"
            cell.noticeDayLabel.text = "2021.09.29"
            cell.selectionStyle = .none
            return cell
        case 14:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell", for: indexPath) as! NoticeTableViewCell
            cell.noticeTitleLabel.text = "바로결제 서비스 일시 중단 안내"
            cell.noticeDayLabel.text = "2021.09.13"
            cell.selectionStyle = .none
            return cell
        case 15:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell", for: indexPath) as! NoticeTableViewCell
            cell.noticeTitleLabel.text = "서비스 이용약관 개정 안내"
            cell.noticeDayLabel.text = "2021.08.30"
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
            return 82
        case 2:
            return 82
            
        case 3:
            return 82
        case 4:
            return 82
        case 5:
            return 82
        case 6:
            return 82
        case 7:
            return 82
        case 8:
            return 82
        case 9:
            return 82
        case 10:
            return 82
        case 11:
            return 82
        case 12:
            return 82
        case 13:
            return 82
        case 14:
            return 82
        case 15:
            return 82
        default:
            return 0

        }
    
  
    
    }
}
