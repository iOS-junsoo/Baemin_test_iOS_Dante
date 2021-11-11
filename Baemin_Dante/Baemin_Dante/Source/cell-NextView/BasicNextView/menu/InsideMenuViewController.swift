//
//  InsideMenuViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/11.
//

import UIKit

class InsideMenuViewController: UIViewController {
    @IBOutlet var foodName: UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var deliveryPay: UILabel!
    
    
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
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "advertisementTableViewCell", bundle: nil), forCellReuseIdentifier: "advertisementTableViewCell") //nib 파일 등록
        tableView.register(UINib(nibName: "InsidefirstTableViewCell", bundle: nil), forCellReuseIdentifier: "InsidefirstTableViewCell") //nib 파일 등록
        tableView.register(UINib(nibName: "InsidesecondTableViewCell", bundle: nil), forCellReuseIdentifier: "InsidesecondTableViewCell") //nib 파일 등록

        
        
    }
    
    func setInside() {
        foodName.text = CNDataModel.restaurantName
        deliveryPay.text = "배달초소주문 금액\(CNDataModel.restaurantDeliveryPay)원"
    }
    

}
extension InsideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //cell의 갯수 설정
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //cell의 데이터 구성
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InsidefirstTableViewCell") as! InsidefirstTableViewCell
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InsidesecondTableViewCell") as! InsidesecondTableViewCell
            cell.selectionStyle = .none
            cell.OptionTitle.text = "어떤 찜닭으로 드릴까요 선택"
            cell.foodOption1.text = "간장 순살 찜닭"
            cell.foodOption2.text = "빨간 순살 찜닭"
            cell.foodOption3.text = "로제 순살 찜닭"
            cell.foodOption4.text = "마라 순살 찜닭"
            cell.foodOptionPrice1.text = "+0원"
            cell.foodOptionPrice2.text = "+0원"
            cell.foodOptionPrice3.text = "+2000원"
            cell.foodOptionPrice4.text = "+1000원"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InsidesecondTableViewCell") as! InsidesecondTableViewCell
            cell.selectionStyle = .none
            cell.OptionTitle.text = "찜닭 '맵기'는 어떻게 해드릴까요 선택"
            cell.foodOption1.text = "1단계: 보통 맛"
            cell.foodOption2.text = "2단계 : 매콤한 맛"
            cell.foodOption3.text = "3단계 : 매운 맛"
            cell.foodOption4.text = "4단계 : 아주 매운 맛"
            cell.foodOptionPrice1.text = "+0원"
            cell.foodOptionPrice2.text = "+0원"
            cell.foodOptionPrice3.text = "+0원"
            cell.foodOptionPrice4.text = "+0원"
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InsidesecondTableViewCell") as! InsidesecondTableViewCell
            cell.selectionStyle = .none
            cell.OptionTitle.text = "어떤 치킨으로 드릴까요 선택"
            cell.foodOption1.text = "후라이드 순살 치킨"
            cell.foodOption2.text = "양념 순살 치킨"
            cell.foodOption3.text = "간장 순살 치킨"
            cell.foodOption4.text = "파닭 순살 치킨"
            cell.foodOptionPrice1.text = "+0원"
            cell.foodOptionPrice2.text = "+1000원"
            cell.foodOptionPrice3.text = "+1000원"
            cell.foodOptionPrice4.text = "+1000원"
            return cell
        default:
            return UITableViewCell()
        }
        
     
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { //cell의 높이 설정

        switch indexPath.row {
        case 0 :
            return 470
        case 1 :
            return 335
        case 2 :
            return 335
        case 3:
            return 335
        default:
            return 0
        }
    }
}
