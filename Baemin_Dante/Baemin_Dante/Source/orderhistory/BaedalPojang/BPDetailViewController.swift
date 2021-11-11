//
//  BPDetailViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/11.
//

import UIKit

class BPDetailViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        BPDetailRequest().getData()
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
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    tableView.register(UINib(nibName: "BPDetailfirstTableVIewTableViewCell", bundle: nil), forCellReuseIdentifier: "BPDetailfirstTableVIewTableViewCell") //nib 파일 등록
    tableView.register(UINib(nibName: "BPDetailsecondTableViewCell", bundle: nil), forCellReuseIdentifier: "BPDetailsecondTableViewCell") //nib 파일 등록
    tableView.register(UINib(nibName: "BPDetailthirdTableViewCell", bundle: nil), forCellReuseIdentifier: "BPDetailthirdTableViewCell") //nib 파일 등록
    
    tableView.register(UINib(nibName: "contourTableViewCell", bundle: nil), forCellReuseIdentifier: "contourTableViewCell") //nib 파일 등록
    }

}

extension BPDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //cell의 갯수 설정
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //cell의 데이터 구성
        
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "contourTableViewCell", for: indexPath) as! contourTableViewCell
            cell.selectionStyle = .none
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BPDetailfirstTableVIewTableViewCell") as! BPDetailfirstTableVIewTableViewCell
            cell.titleName.text = BPDetilModelData.storeName
            cell.menyuName.text = BPDetilModelData.menuName
            cell.selectionStyle = .none
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "contourTableViewCell", for: indexPath) as! contourTableViewCell
            cell.selectionStyle = .none
            
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BPDetailsecondTableViewCell") as! BPDetailsecondTableViewCell
            cell.orderPrice.text = "\(BPDetilModelData.menuPrice)원"
            cell.foodName.text = BPDetilModelData.storeName
            cell.totalPrice.text = "\(BPDetilModelData.totalPrice)원"
            cell.deliveryTip.text = "\(BPDetilModelData.deliveryTip)원"
            cell.foodPrice.text = "\(BPDetilModelData.menuPrice)원"
            cell.selectionStyle = .none
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "contourTableViewCell", for: indexPath) as! contourTableViewCell
            cell.selectionStyle = .none
            
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BPDetailthirdTableViewCell") as! BPDetailthirdTableViewCell
            cell.phonNumber.text = "\(BPDetilModelData.phone)"
            cell.locationLabel.text = "\(BPDetilModelData.location)"
            cell.selectionStyle = .none
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "contourTableViewCell", for: indexPath) as! contourTableViewCell
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
            return 264
        case 2:
            return 10
        case 3:
            return 364
        case 4:
            return 10
        case 5:
            return 338
        case 6:
            return 10
        
        default:
            return 0
        }

    }
}

extension BPDetailViewController {
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
