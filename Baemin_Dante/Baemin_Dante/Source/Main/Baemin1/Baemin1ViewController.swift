//
//  Baemin1ViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/04.
//

import UIKit

class Baemin1ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    //MARK: - 데이터 모델
    var models = [Model]()
    var models2 = [Model2]()
    var models3 = [Model3]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //MARK: - navigationbar back button hide
        self.navigationItem.setHidesBackButton(true, animated: true)
        setUpTableView()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        if PageCheck.page1Check == 0{
//            Page.pageTitle2 = 0
//            PageCheck.page1Check = 1
//            print(Page.pageTitle2)
//        }
//    }
    
    func setUpTableView() {
        models.append(Model(imageName: "배달화면광고1"))
        models.append(Model(imageName: "배달화면광고2"))
        models.append(Model(imageName: "배달화면광고3"))
        
        models2.append(Model2(imageName: "오늘광고3"))
        models2.append(Model2(imageName: "오늘광고2"))
        models2.append(Model2(imageName: "오늘광고1"))
        models3.append(Model3(imageName: "빠른광고1", baeminName: "천하원요리", baeminStar: "4.7", baeminTip: "3,000원", imageTime: "15-25분"))
        models3.append(Model3(imageName: "빠른광고2", baeminName: "메가MGC커피 송도퍼스트파크점", baeminStar: "4.7", baeminTip: "3,000원", imageTime: "15-25분"))
        models3.append(Model3(imageName: "빠른광고3", baeminName: "구구족 송도점", baeminStar: "4.9", baeminTip: "0원~3,000원", imageTime: "13-23분"))
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "BannerTableViewCell", bundle: nil), forCellReuseIdentifier: "BannerTableViewCell") //nib 파일 등록
        tableView.register(UINib(nibName: "BBTableViewCell", bundle: nil), forCellReuseIdentifier: "BBTableViewCell") //nib 파일 등록
        tableView.register(UINib(nibName: "TodayTableViewCell", bundle: nil), forCellReuseIdentifier: "TodayTableViewCell") //nib 파일 등록
        tableView.register(UINib(nibName: "contourTableViewCell", bundle: nil), forCellReuseIdentifier: "contourTableViewCell")
        tableView.register(UINib(nibName: "fourthTableViewCell", bundle: nil), forCellReuseIdentifier: "fourthTableViewCell") //nib 파일 등록
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationController?.setNavigationBarHidden(true, animated: animated)
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            self.navigationController?.setNavigationBarHidden(false, animated: animated)
        }

    
}

extension Baemin1ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //cell의 갯수 설정
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //cell의 데이터 구성
        //firstTableViewCell
        

        switch indexPath.row {

        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell", for: indexPath) as! BannerTableViewCell
            cell.configure(with: models)
//            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BBTableViewCell", for: indexPath) as! BBTableViewCell
//            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "contourTableViewCell", for: indexPath) as! contourTableViewCell
            cell.selectionStyle = .none
            return cell
            

        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "fourthTableViewCell", for: indexPath) as! fourthTableViewCell
            cell.configure(with: models3)
            cell.selectionStyle = .none
            return cell

        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { //cell의 높이 설정
                
        switch indexPath.row {
        case 0:
            return 130
        case 1:
            return 220
        case 2:
            return 10
        case 3:
            return 320
//        case 3:
//            return 235
        default:
            return 100
        }
    }
    
    
}

//extension Baemin1ViewController: ButtonDelegate {
//    func nextView() {
//        let storyBoard = UIStoryboard(name: "Paging2Storyboard", bundle: nil)
//        if let detailVC = storyBoard.instantiateViewController(withIdentifier: "Paging2ViewController") as? Paging2ViewController {
//            self.navigationController?.pushViewController(detailVC, animated: true)
//        }
//    }
//}
