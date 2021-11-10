//
//  AppointmentViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/10.
//

import UIKit

class AppointmentViewController: UIViewController {

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
        tableView.register(UINib(nibName: "BCTableViewCell", bundle: nil), forCellReuseIdentifier: "BCTableViewCell") //nib 파일 등록
        
    }

}

extension AppointmentViewController: UITableViewDelegate, UITableViewDataSource {
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //cell의 갯수 설정
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //cell의 데이터 구성
        
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "contourTableViewCell", for: indexPath) as! contourTableViewCell
            cell.selectionStyle = .none
            return cell

        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BCTableViewCell", for: indexPath) as! BCTableViewCell
            cell.titleLabel.text = "사업자정보확인"
            cell.selectionStyle = .none
            return cell
            
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BCTableViewCell", for: indexPath) as! BCTableViewCell
            cell.titleLabel.text = "이용약관"
            cell.selectionStyle = .none
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BCTableViewCell", for: indexPath) as! BCTableViewCell
            cell.titleLabel.text = "전자금융거래 이용약관"
            cell.selectionStyle = .none
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BCTableViewCell", for: indexPath) as! BCTableViewCell
            cell.titleLabel.text = "개인정보 처리방침"
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
            return 55
        case 2:
            return 55
        case 3:
            return 55
        case 4:
            return 55
        
        default:
            return 0

        }
    
  
    
    }
}
