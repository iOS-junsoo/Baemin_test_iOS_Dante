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
        
            self.setUpTableView()
        
    }
    
    func setUpTableView() {
        models.append(ReviewModel(nickName: "단테", day: "어제", review: "반찬도 맛있어요", menu: "구이세트 A번"))
        models.append(ReviewModel(nickName: "우니", day: "2일전", review: "이 집 잘하네", menu: "구이세트 B번"))
        models.append(ReviewModel(nickName: "나루", day: "5일전", review: "존맛탱", menu: "구이세트 D번"))
        models.append(ReviewModel(nickName: "하이디", day: "2달전", review: "JMT", menu: "구이세트 C번"))
        models.append(ReviewModel(nickName: "준수", day: "5달전", review: "고소하이 직이네", menu: "구이세트 A번"))
        models.append(ReviewModel(nickName: "상운", day: "작년", review: "음냐", menu: "구이세트 E번"))
        models.append(ReviewModel(nickName: "나리", day: "작년", review: "두명이 먹다가 한명이 죽어도 모르겠네", menu: "구이세트 A번"))
        
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
