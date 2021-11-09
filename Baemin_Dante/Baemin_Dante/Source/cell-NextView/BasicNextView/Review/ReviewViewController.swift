//
//  ReviewViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/08.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var models = [ReviewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTableView()
    }
    
    func setUpTableView() {
        models.append(ReviewModel(nickName: "단테", day: "어제", review: "반찬도 맛있어요", menu: "구이세트 A번"))
        models.append(ReviewModel(nickName: "준수", day: "3일 전", review: "배불리 잘 먹었습니다!", menu: "구이세트 A번"))
        models.append(ReviewModel(nickName: "상현", day: "지난 달", review: "맛있어요", menu: "구이세트 B번"))
        models.append(ReviewModel(nickName: "진홍", day: "3개월 전", review: "존맛탱", menu: "구이세트 1인"))
        models.append(ReviewModel(nickName: "길현", day: "6개월 전", review: "맛있네 이집", menu: "볶음세트 C번"))
        models.append(ReviewModel(nickName: "승찬", day: "7개월 전", review: "이집 잘하네", menu: "구이세트 A번"))
        models.append(ReviewModel(nickName: "온주", day: "10개월 전", review: "맛집이네", menu: "볶음세트 A번"))
        models.append(ReviewModel(nickName: "상치", day: "1년 전", review: "존맛", menu: "구이세트 D번"))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewTableViewCell") //nib 파일 등록
    }

}

extension ReviewViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //cell의 갯수 설정
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //cell의 데이터 구성
        let cellDataContent = models[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell") as! ReviewTableViewCell
        
        cell.userNickname.setTitle(cellDataContent.nickName, for: .normal)
        cell.userday.text = cellDataContent.day
        cell.userReview.text = cellDataContent.review
        cell.userMenu.setTitle(cellDataContent.menu, for: .normal)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { //cell의 높이 설정

        return 165
    }
    
//    //cell을 클릭했는지 확인해주는 메소드
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let alStoryboard = UIStoryboard(name: "StarNextStoryboard", bundle: nil) //스토리보드 결정
//        let alarmVC = alStoryboard.instantiateViewController(identifier: "StarNextViewController")
//        self.navigationController?.pushViewController(alarmVC, animated: true)
//    }
 
}
