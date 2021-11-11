//
//  BMViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/09.
//

import UIKit

class BPViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTableView()
    }
    

    func setUpTableView() {
       
        tableView.delegate = self
        tableView.dataSource = self
      
        tableView.register(UINib(nibName: "BPTableViewCell", bundle: nil), forCellReuseIdentifier: "BPTableViewCell") //nib 파일 등록
        tableView.register(UINib(nibName: "contourTableViewCell", bundle: nil), forCellReuseIdentifier: "contourTableViewCell") //nib 파일 등록

        
        
    }

}

extension BPViewController: UITableViewDelegate, UITableViewDataSource {
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //cell의 갯수 설정
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //cell의 데이터 구성
        
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "contourTableViewCell") as! contourTableViewCell
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BPTableViewCell") as! BPTableViewCell
            cell.selectionStyle = .none
            cell.titleLabel.text = "혼밥대왕"
            cell.deliveryComplete.text = "1시간전·배달완료"
            cell.detailLabel.text = "갈치한마리조림+공기밥+반찬4종 외 1개 14,850원"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "contourTableViewCell") as! contourTableViewCell
            cell.selectionStyle = .none
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BPTableViewCell") as! BPTableViewCell
            cell.selectionStyle = .none
            cell.titleLabel.text = "혼밥대왕"
            cell.deliveryComplete.text = "1시간전·배달완료"
            cell.detailLabel.text = "갈치한마리조림+공기밥+반찬4종 외 1개 14,850원"
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "contourTableViewCell") as! contourTableViewCell
            cell.selectionStyle = .none
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BPTableViewCell") as! BPTableViewCell
            cell.selectionStyle = .none
            cell.titleLabel.text = "혼밥대왕"
            cell.deliveryComplete.text = "1시간전·배달완료"
            cell.detailLabel.text = "갈치한마리조림+공기밥+반찬4종 외 1개 14,850원"
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "contourTableViewCell") as! contourTableViewCell
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
            return 146
        case 2:
            return 10
        case 3:
            return 146
        case 4:
            return 10
        case 5:
            return 146
        case 6:
            return 10
        default:
            return 0
        }
    
  
    
    }
}
