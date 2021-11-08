//
//  BaketViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/07.
//

import UIKit

class BaketViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var orderButton: UIButton!
    
    var models1 = [BaketModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - navigationbar back button hide
        self.navigationItem.setHidesBackButton(true, animated: true)
        orderButton.adjustsImageWhenHighlighted = false
        setUpTableView()

    }
    
    func setUpTableView() {
        models1.append(BaketModel(foodTitle: "모밀비빔", foodPrice: 7000))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TitleTableViewCell", bundle: nil), forCellReuseIdentifier: "TitleTableViewCell") //nib 파일 등록
        tableView.register(UINib(nibName: "RadioTableViewCell", bundle: nil), forCellReuseIdentifier: "RadioTableViewCell") //nib 파일 등록
        tableView.register(UINib(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier: "FoodTableViewCell") //nib 파일 등록
        tableView.register(UINib(nibName: "MoreTableViewCell", bundle: nil), forCellReuseIdentifier: "MoreTableViewCell") //nib 파일 등록
        tableView.register(UINib(nibName: "TotalTableViewCell", bundle: nil), forCellReuseIdentifier: "TotalTableViewCell") //nib 파일 등록

        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationController?.setNavigationBarHidden(true, animated: animated)
        tableView.reloadData()
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            self.navigationController?.setNavigationBarHidden(false, animated: animated)
            tableView.reloadData()
        }
    
    @IBAction func foodOrderTap(_ sender: UIButton) {
        let alStoryboard = UIStoryboard(name: "OrderfoodStoryboard", bundle: nil) //스토리보드 결정
        let alarmVC = alStoryboard.instantiateViewController(identifier: "OrderfoodViewController")
        self.navigationController?.pushViewController(alarmVC, animated: true)
    }
    @IBAction func allDelete(_ sender: UIButton) {
        tableView.reloadData()
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension BaketViewController: UITableViewDelegate, UITableViewDataSource {
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //cell의 갯수 설정
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //cell의 데이터 구성
        
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleTableViewCell") as! TitleTableViewCell
            cell.title.text = "청실홍실 송도신도시점" //식당리스트에서 해당 식당의 Cell을 클릭하면 그 식당의 이름이 전역변수에 저장되어 이 곳에서 Title을 넣는다
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RadioTableViewCell") as! RadioTableViewCell
            cell.selectionStyle = .none
            return cell
        case 2:
            let cellData = models1[0]
            let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTableViewCell") as! FoodTableViewCell
            cell.foodName.text = cellData.foodTitle
            cell.foodPrice.text = "\(cellData.foodPrice)원"
            Baket.foodPrice = cellData.foodPrice
            Baket.foodtotalPrice = cellData.foodPrice
            cell.foodCount.text = "1개" //+ - 버튼의 클릭에 따라서 전역변수에 해당 수를 저장해서 다시 이 변수에 저장 "\(전역변수)개" 형태로 저장
            cell.foodTotalPrice.text = "7000원" // "\(전역변수)개" 형태로 저장
            cell.selectionStyle = .none
            cell.delegate = self
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MoreTableViewCell") as! MoreTableViewCell
            cell.selectionStyle = .none
            cell.delegate = self
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TotalTableViewCell") as! TotalTableViewCell
//            cell.totalPrice.text = "7,000원"
            orderButton.setTitle("7,000원 주문하기", for: .normal)
            orderButton.setImage(UIImage(systemName: "1.circle.fill"), for: .normal)
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { //cell의 높이 설정

        switch indexPath.row {
        case 0:
            return 50
        case 1:
            return 125
        case 2:
            return 155
        case 3:
            return 50
        case 4:
            return 52
        default:
            return 0
        }
    
  
    
    }
}
extension BaketViewController: CustomBaketDelegate {
    func pastView() {
        self.navigationController?.popViewController(animated: true)
        print("VC")
    }
    func reloadView() {
        print("reload")
        let cell = tableView.dequeueReusableCell(withIdentifier: "TotalTableViewCell") as! TotalTableViewCell
        cell.totalPrice.text = "\(Baket.totalPrice)원"
        print(cell.totalPrice.text)
    }
}



extension BaketViewController {
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
