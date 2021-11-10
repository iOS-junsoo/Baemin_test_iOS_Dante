//
//  BasicViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/07.
//

import UIKit

class BasicViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var models1 = [FastModel1]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        
    }
    func setUpTableView() {
       
        models1.append(FastModel1(imageName: "돈포레스트", title: "돈 포르세트 청청 제주 돼지숯불구이", star: "4.2", review: "(10+)", menu: "제주 삼겹살, 제주 흑돼지 오겹살", OrderPay: "최소주문 30,000원, 배달팁 0원", deliveryPay: "0원", deliveryTime: "40~55분"))
        models1.append(FastModel1(imageName: "꾸꾸삼겹", title: "꾸꾸삼겹 인천송도점", star: "4.8", review: "(50+)", menu: "[브랜드3관왕] 냉면2500원, [가성비맛집] 꾸꾸실속", OrderPay: "최소주문 8,000원, 배달팁 1,000원", deliveryPay: "1,000원", deliveryTime: "68~83분"))
        models1.append(FastModel1(imageName: "소꼬리전문점무궁", title: "소꼬리전문점 무궁", star: "4.8", review: "(50+)", menu: "꼬리구이, 로제꼬리", OrderPay: "최소주문 20,000원, 배달팁 0원~", deliveryPay: "0원~", deliveryTime: "39~54분"))
        models1.append(FastModel1(imageName: "쫄면주는삼겹본능", title: "쫄면주는삼겹본능by놀부 송도 스마트밸리점", star: "4.9", review: "(50+)", menu: "구이삼겹 1인 도시락, 구이삼겹 2인 도시락", OrderPay: "최소주문 15,000원, 배달팁 2,500원", deliveryPay: "2.500원", deliveryTime: "40~55분"))
        models1.append(FastModel1(imageName: "혼밥대왕", title: "혼밥대왕 인천송도1호점", star: "4.9", review: "(100+)", menu: "제주흑돼지 김치볶음, 만두 흑돼지 김치찌개", OrderPay: "최소주문 69,000원, 배달팁 500원~", deliveryPay: "500원~", deliveryTime: "31~46분"))
        models1.append(FastModel1(imageName: "송토육개장", title: "송토 육개장", star: "4.8", review: "(50+)", menu: "육개장, 굴육개장", OrderPay: "최소주문 15,000원, 배달팁 3,000원", deliveryPay: "3,000원", deliveryTime: "49~64분"))
        models1.append(FastModel1(imageName: "돈포레스트", title: "돈 포르세트 청청 제주 돼지숯불구이", star: "4.2", review: "(10+)", menu: "제주 삼겹살, 제주 흑돼지 오겹살", OrderPay: "최소주문 30,000원, 배달팁 0원", deliveryPay: "0원", deliveryTime: "40~55분"))
        models1.append(FastModel1(imageName: "꾸꾸삼겹", title: "꾸꾸삼겹 인천송도점", star: "4.8", review: "(50+)", menu: "[브랜드3관왕] 냉면2500원, [가성비맛집] 꾸꾸실속", OrderPay: "최소주문 8,000원, 배달팁 1,000원", deliveryPay: "1,000원", deliveryTime: "68~83분"))
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "OpenListTableViewCell", bundle: nil), forCellReuseIdentifier: "OpenListTableViewCell") //nib 파일 등록
        
        
    }

}
extension BasicViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //cell의 갯수 설정
        return models1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //cell의 데이터 구성
        let cellDataContent1 = models1[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "OpenListTableViewCell") as! OpenListTableViewCell
        cell.imagName.image = UIImage(named: cellDataContent1.imageName)
        cell.title.text = cellDataContent1.title
        cell.star.text = cellDataContent1.star
        cell.review.text = cellDataContent1.review
        cell.menu.text = cellDataContent1.menu
        cell.orderPay.text = cellDataContent1.OrderPay
        cell.orderTime.setTitle(cellDataContent1.deliveryTime, for: .normal)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { //cell의 높이 설정

        return 125
    }
    
    //cell을 클릭했는지 확인해주는 메소드
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alStoryboard = UIStoryboard(name: "StarNextStoryboard", bundle: nil) //스토리보드 결정
        let alarmVC = alStoryboard.instantiateViewController(identifier: "StarNextViewController")
        self.navigationController?.pushViewController(alarmVC, animated: true)
    }
 
}
