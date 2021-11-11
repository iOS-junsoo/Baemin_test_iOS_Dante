//
//  OrderViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/07.
//

import UIKit
import Toast_Swift

class OrderfoodViewController: UIViewController {

    @IBOutlet var myView2: UIView!
    @IBOutlet var myView: UIView!
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //View에 그림자
       myView.layer.shadowColor = UIColor.black.cgColor // 색깔
       myView.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
       myView.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
       myView.layer.shadowRadius = 5 // 반경
       myView.layer.shadowOpacity = 0.1 // alpha값
//        myView2.layer.shadowColor = UIColor.black.cgColor // 색깔
//        myView2.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
//        myView2.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
//        myView2.layer.shadowRadius = 5 // 반경
//        myView2.layer.shadowOpacity = 0.3 // alpha값
        
        //MARK: - navigationbar back button hide
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
        OrderRequest().getData()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
            self.setUpTableView()
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
    @IBAction func paymentBtnTap(_ sender: UIButton) {
        self.view.makeToast("결제가 완료되었습니다.", duration: 1.0, position: .center)
        
        OrederPostRequest().postData()

    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    tableView.register(UINib(nibName: "firstOrderTableViewCell", bundle: nil), forCellReuseIdentifier: "firstOrderTableViewCell") //nib 파일 등록
    tableView.register(UINib(nibName: "secondOrderTableViewCell", bundle: nil), forCellReuseIdentifier: "secondOrderTableViewCell") //nib 파일 등록
    tableView.register(UINib(nibName: "thirdOrderTableViewCell", bundle: nil), forCellReuseIdentifier: "thirdOrderTableViewCell") //nib 파일 등록
    tableView.register(UINib(nibName: "fourthOrderTableViewCell", bundle: nil), forCellReuseIdentifier: "fourthOrderTableViewCell") //nib 파일 등록
    tableView.register(UINib(nibName: "fifthOrderTableViewCell", bundle: nil), forCellReuseIdentifier: "fifthOrderTableViewCell") //nib 파일 등록
    tableView.register(UINib(nibName: "contourTableViewCell", bundle: nil), forCellReuseIdentifier: "contourTableViewCell") //nib 파일 등록
    }

}

extension OrderfoodViewController: UITableViewDelegate, UITableViewDataSource {
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //cell의 갯수 설정
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //cell의 데이터 구성
        
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "contourTableViewCell", for: indexPath) as! contourTableViewCell
            cell.selectionStyle = .none
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstOrderTableViewCell") as! firstOrderTableViewCell
            cell.phonNumber.text = OrederDataModel.orderPhone
            cell.selectionStyle = .none
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "contourTableViewCell", for: indexPath) as! contourTableViewCell
            cell.selectionStyle = .none
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondOrderTableViewCell") as! secondOrderTableViewCell
            cell.selectionStyle = .none
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "contourTableViewCell", for: indexPath) as! contourTableViewCell
            cell.selectionStyle = .none
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "thirdOrderTableViewCell") as! thirdOrderTableViewCell
            cell.selectionStyle = .none
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "contourTableViewCell", for: indexPath) as! contourTableViewCell
            cell.selectionStyle = .none
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: "fourthOrderTableViewCell") as! fourthOrderTableViewCell
            cell.titleLabel.text = "선물함"
            cell.selectionStyle = .none
            return cell
        case 8:
            let cell = tableView.dequeueReusableCell(withIdentifier: "fourthOrderTableViewCell", for: indexPath) as! fourthOrderTableViewCell
            cell.titleLabel.text = "할인쿠폰"
            cell.selectionStyle = .none
            return cell
        case 9:
            let cell = tableView.dequeueReusableCell(withIdentifier: "fourthOrderTableViewCell", for: indexPath) as! fourthOrderTableViewCell
            cell.titleLabel.text = "배민포인트"
            cell.selectionStyle = .none
            return cell
        case 10:
            let cell = tableView.dequeueReusableCell(withIdentifier: "fourthOrderTableViewCell") as! fourthOrderTableViewCell
            cell.titleLabel.text = "엘포인트"
            cell.selectionStyle = .none
            return cell
        case 11:
            let cell = tableView.dequeueReusableCell(withIdentifier: "fourthOrderTableViewCell") as!fourthOrderTableViewCell
            cell.titleLabel.text = "OK캐쉬백"
            cell.selectionStyle = .none
            return cell
        case 12:
            let cell = tableView.dequeueReusableCell(withIdentifier: "contourTableViewCell") as! contourTableViewCell
            cell.selectionStyle = .none
            return cell
        case 13:
            let cell = tableView.dequeueReusableCell(withIdentifier: "fifthOrderTableViewCell") as! fifthOrderTableViewCell
            cell.totalPrice.text = "30900원"
            cell.deliveryPay.text = "\(OrederDataModel.orderDeliveryFee)원"
            cell.orderPrice.text = "27900원"
            cell.selectionStyle = .none
            return cell
        case 14:
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
            return 385
        case 2:
            return 10
        case 3:
            return 436
        case 4:
            return 10
        case 5:
            return 504
        case 6:
            return 10
        case 7:
            return 60
        case 8:
            return 60
        case 9:
            return 60
        case 10:
            return 60
        case 11:
            return 60
        case 12:
            return 10
        case 13:
            return 200
        case 14:
            return 50
        default:
            return 0
        }

    }
}

extension OrderfoodViewController {
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
