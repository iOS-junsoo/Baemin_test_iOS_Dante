//
//  FastViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/07.
//

import UIKit

class FastViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var models1 = [FastTieleModel]()
    var models2 = [FastModel1]() //오픈리스트 광고 Model
    var models3 = [FastModel2]() //울트라콜 광고 Model
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTableView()
        
    }
    func setUpTableView() {
        models1.append(FastTieleModel(advertisementTitle: "오픈리스트"))
        models1.append(FastTieleModel(advertisementTitle: "울트라콜"))
        models2.append(FastModel1(imageName: "혼밥대왕", title: "혼밥대왕 인천송도1호점", star: "4.9", review: "(100+)", menu: "제주흑돼지 김치볶음, 만두 흑돼지 김치찌개", OrderPay: "6,900원", deliveryPay: "500원~", deliveryTime: "31~46분"))
        models2.append(FastModel1(imageName: "송토육개장", title: "송토 육개장", star: "4.8", review: "(50+)", menu: "육개장, 굴육개장", OrderPay: "15,000원", deliveryPay: "3,000원", deliveryTime: "49~64분"))
        models2.append(FastModel1(imageName: "소꼬리전문점무궁", title: "소꼬리전문점 무궁", star: "4.8", review: "(50+)", menu: "꼬리구이, 로제꼬리", OrderPay: "20,000원", deliveryPay: "0원~", deliveryTime: "39~54분"))
        models3.append(FastModel2(imageName: "꾸꾸삼겹", title: "꾸꾸삼겹 인천송도점", star: "4.8", review: "(50+)", menu: "[브랜드3관왕] 냉면2500원, [가성비맛집] 꾸꾸실속", OrderPay: "8,000원", deliveryPay: "1,000원", deliveryTime: "68~83분"))
        models3.append(FastModel2(imageName: "돈포레스트", title: "돈 포르세트 청청 제주 돼지숯불구이", star: "4.2", review: "(10+)", menu: "제주 삼겹살, 제주 흑돼지 오겹살", OrderPay: "30,000원", deliveryPay: "0원", deliveryTime: "40~55분"))
        models3.append(FastModel2(imageName: "쫄면주는삼겹본능", title: "쫄면주는삼겹본능by놀부 송도 스마트밸리점", star: "4.9", review: "(50+)", menu: "구이삼겹 1인 도시락, 구이삼겹 2인 도시락", OrderPay: "15,000원", deliveryPay: "2.500원", deliveryTime: "40~55분"))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "advertisementTableViewCell", bundle: nil), forCellReuseIdentifier: "advertisementTableViewCell") //nib 파일 등록
        tableView.register(UINib(nibName: "OpenListTableViewCell", bundle: nil), forCellReuseIdentifier: "OpenListTableViewCell") //nib 파일 등록
        tableView.register(UINib(nibName: "UltraCallTableViewCell", bundle: nil), forCellReuseIdentifier: "UltraCallTableViewCell") //nib 파일 등록

        
        
    }

}

extension FastViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //cell의 갯수 설정
        switch section {
        case 0:
            return 3
        case 1:
            return 3
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //cell의 데이터 구성
 
        let cellDataTitle = models1[indexPath.section]
        let cellDataContent1 = models2[indexPath.row]
        let cellDataContent2 = models3[indexPath.row]
        
        switch indexPath.section {
        case 0 :
            
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "advertisementTableViewCell") as! advertisementTableViewCell
                cell.titleLabel.text = cellDataTitle.advertisementTitle
                cell.selectionStyle = .none
                return cell
            } else if indexPath.row == 1{
                let cell = tableView.dequeueReusableCell(withIdentifier: "OpenListTableViewCell") as! OpenListTableViewCell
                cell.imagName.image = UIImage(named: cellDataContent1.imageName)
                cell.title.text = cellDataContent1.title
                cell.star.text = cellDataContent1.star
                cell.review.text = cellDataContent1.review
                cell.menu.text = cellDataContent1.menu
                cell.orderPay.text = cellDataContent1.OrderPay
                cell.deliveryPay.text = cellDataContent1.deliveryPay
                cell.orderTime.setTitle(cellDataContent1.deliveryTime, for: .normal)
                cell.selectionStyle = .none
                return cell
            } else if indexPath.row == 2{
                let cell = tableView.dequeueReusableCell(withIdentifier: "OpenListTableViewCell") as! OpenListTableViewCell
                cell.imagName.image = UIImage(named: cellDataContent1.imageName)
                cell.title.text = cellDataContent1.title
                cell.star.text = cellDataContent1.star
                cell.review.text = cellDataContent1.review
                cell.menu.text = cellDataContent1.menu
                cell.orderPay.text = cellDataContent1.OrderPay
                cell.deliveryPay.text = cellDataContent1.deliveryPay
                cell.orderTime.setTitle(cellDataContent1.deliveryTime, for: .normal)
                cell.selectionStyle = .none
                return cell
            } else if indexPath.row == 3{
                let cell = tableView.dequeueReusableCell(withIdentifier: "OpenListTableViewCell") as! OpenListTableViewCell
                cell.imagName.image = UIImage(named: cellDataContent1.imageName)
                cell.title.text = cellDataContent1.title
                cell.star.text = cellDataContent1.star
                cell.review.text = cellDataContent1.review
                cell.menu.text = cellDataContent1.menu
                cell.orderPay.text = cellDataContent1.OrderPay
                cell.deliveryPay.text = cellDataContent1.deliveryPay
                cell.orderTime.setTitle(cellDataContent1.deliveryTime, for: .normal)
                cell.selectionStyle = .none
                return cell
            } else {
//                let cell = tableView.dequeueReusableCell(withIdentifier: "OpenListTableViewCell") as! OpenListTableViewCell
//                cell.imagName.image = UIImage(named: cellDataContent1.imageName)
//                cell.title.text = cellDataContent1.title
//                cell.star.text = cellDataContent1.star
//                cell.review.text = cellDataContent1.review
//                cell.menu.text = cellDataContent1.menu
//                cell.orderPay.text = cellDataContent1.OrderPay
//                cell.deliveryPay.text = cellDataContent1.deliveryPay
//                cell.orderTime.setTitle(cellDataContent1.deliveryTime, for: .normal)
//                return cell
                return UITableViewCell()
            }
        case 1 :
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "advertisementTableViewCell") as! advertisementTableViewCell
                cell.titleLabel.text = cellDataTitle.advertisementTitle
                cell.selectionStyle = .none
                return cell
            } else if indexPath.row == 1{
                let cell = tableView.dequeueReusableCell(withIdentifier: "UltraCallTableViewCell") as! UltraCallTableViewCell
                cell.imagName.image = UIImage(named: cellDataContent2.imageName)
                cell.title.text = cellDataContent2.title
                cell.star.text = cellDataContent2.star
                cell.review.text = cellDataContent2.review
                cell.menu.text = cellDataContent2.menu
                cell.orderPay.text = cellDataContent2.OrderPay
                cell.deliveryPay.text = cellDataContent2.deliveryPay
                cell.orderTime.setTitle(cellDataContent2.deliveryTime, for: .normal)
                cell.selectionStyle = .none
                return cell
            } else if indexPath.row == 2{
                let cell = tableView.dequeueReusableCell(withIdentifier: "UltraCallTableViewCell") as! UltraCallTableViewCell
                cell.imagName.image = UIImage(named: cellDataContent2.imageName)
                cell.title.text = cellDataContent2.title
                cell.star.text = cellDataContent2.star
                cell.review.text = cellDataContent2.review
                cell.menu.text = cellDataContent2.menu
                cell.orderPay.text = cellDataContent2.OrderPay
                cell.deliveryPay.text = cellDataContent2.deliveryPay
                cell.orderTime.setTitle(cellDataContent2.deliveryTime, for: .normal)
                cell.selectionStyle = .none
                return cell
            } else if indexPath.row == 3{
                let cell = tableView.dequeueReusableCell(withIdentifier: "UltraCallTableViewCell") as! UltraCallTableViewCell
                cell.imagName.image = UIImage(named: cellDataContent2.imageName)
                cell.title.text = cellDataContent2.title
                cell.star.text = cellDataContent2.star
                cell.review.text = cellDataContent2.review
                cell.menu.text = cellDataContent2.menu
                cell.orderPay.text = cellDataContent2.OrderPay
                cell.deliveryPay.text = cellDataContent2.deliveryPay
                cell.orderTime.setTitle(cellDataContent2.deliveryTime, for: .normal)
                cell.selectionStyle = .none
                return cell
            } else {
//                let cell = tableView.dequeueReusableCell(withIdentifier: "UltraCallTableViewCell") as! UltraCallTableViewCell
//                cell.imagName.image = UIImage(named: cellDataContent1.imageName)
//                cell.title.text = cellDataContent2.title
//                cell.star.text = cellDataContent2.star
//                cell.review.text = cellDataContent2.review
//                cell.menu.text = cellDataContent2.menu
//                cell.orderPay.text = cellDataContent2.OrderPay
//                cell.deliveryPay.text = cellDataContent2.deliveryPay
//                cell.orderTime.setTitle(cellDataContent2.deliveryTime, for: .normal)
//                return cell
                
                return UITableViewCell()
            }
        default :
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { //cell의 높이 설정

        switch indexPath.section{
        case 0:
            if indexPath.row == 0 {
                return 25
            } else {
                return 125
            }
        case 1:
            if indexPath.row == 0 {
                return 25
            } else {
                return 125
            }
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0.0
        case 1:
            return 5.0
        default:
            return UITableView.automaticDimension
        }
    }

    //cell을 클릭했는지 확인해주는 메소드
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 한 가게만 구현하기 때문에 따로 indexPath.row에 따라서 나누어 주진 않았다.
        let alStoryboard = UIStoryboard(name: "BacisNextStoryboard", bundle: nil) //스토리보드 결정
        let alarmVC = alStoryboard.instantiateViewController(identifier: "BasicNextViewController")
        self.navigationController?.pushViewController(alarmVC, animated: true)
    }
    
    
}
