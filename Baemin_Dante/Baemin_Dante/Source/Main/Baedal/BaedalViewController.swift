//
//  BaedalViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/04.
//

import UIKit

class BaedalViewController: UIViewController {

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
    
    func setUpTableView() {
        models.append(Model(imageName: "배달화면광고1"))
        models.append(Model(imageName: "배달화면광고2"))
        models.append(Model(imageName: "배달화면광고3"))
        
        models2.append(Model2(imageName: "오늘광고1"))
        models2.append(Model2(imageName: "오늘광고2"))
        models2.append(Model2(imageName: "오늘광고3"))
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "BannerTableViewCell", bundle: nil), forCellReuseIdentifier: "BannerTableViewCell") //nib 파일 등록
        tableView.register(UINib(nibName: "ButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "ButtonTableViewCell") //nib 파일 등록
        tableView.register(UINib(nibName: "TodayTableViewCell", bundle: nil), forCellReuseIdentifier: "TodayTableViewCell") //nib 파일 등록
//        tableView.register(UINib(nibName: "fourthTableViewCell", bundle: nil), forCellReuseIdentifier: "fourthTableViewCell") //nib 파일 등록
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

extension BaedalViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //cell의 갯수 설정
        return 3
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonTableViewCell", for: indexPath) as! ButtonTableViewCell
//            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodayTableViewCell", for: indexPath) as! TodayTableViewCell
            cell.configure(with: models2)
//            cell.delegate = self
            cell.selectionStyle = .none
            return cell

//        case 3:
            

        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { //cell의 높이 설정
                
        switch indexPath.row {
        case 0:
            return 130
        case 1:
            return 290
        case 2:
            return 235
//        case 3:
//            return 235
        default:
            return 100
        }
    }
    
    
}
