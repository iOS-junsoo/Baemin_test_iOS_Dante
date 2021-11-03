//
//  ViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/10/30.
//

import UIKit

class MainViewController: UIViewController {


    @IBOutlet var totalServiceBtn: UIButton!
    @IBOutlet var locationBtn: UIButton!
    @IBOutlet var alarmBtn: UIButton!
    @IBOutlet var myBaeminBtn: UIButton!
    @IBOutlet var tableView: UITableView!
    
    //MARK: pulltorefresh
    var refreshControl: UIRefreshControl!
    
    //MARK: - 데이터 모델
    var models = [Model]()
    var models2 = [Model2]()
    var models3 = [Model3]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        refreshControl = UIRefreshControl()
//        refreshControl.backgroundColor = hexStringToUIColor(hex: "2DC0BD")
//        refreshControl.tintColor = UIColor.clear
//        tableView.addSubview(refreshControl)
        
        tableView.separatorStyle = .none
        setUpTableView()
        //MARK: - 바 버튼 아이템 간격조절
        //이미지 생성

        func setUpTableView() {
            models.append(Model(imageName: "광고1"))
            models.append(Model(imageName: "광고2"))
            models.append(Model(imageName: "광고3"))
            
            models2.append(Model2(imageName: "오늘광고1"))
            models2.append(Model2(imageName: "오늘광고2"))
            models2.append(Model2(imageName: "오늘광고3"))
            
            models3.append(Model3(imageName: "빠른광고1", baeminName: "천하원요리", baeminStar: "4.7", baeminTip: "3,000원", imageTime: "15-25분"))
            models3.append(Model3(imageName: "빠른광고2", baeminName: "메가MGC커피 송도퍼스트파크점", baeminStar: "4.7", baeminTip: "3,000원", imageTime: "15-25분"))
            models3.append(Model3(imageName: "빠른광고3", baeminName: "구구족 송도점", baeminStar: "4.9", baeminTip: "0원~3,000원", imageTime: "13-23분"))
            
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: "firstTableViewCell", bundle: nil), forCellReuseIdentifier: "firstTableViewCell") //nib 파일 등록
            tableView.register(UINib(nibName: "secondTableViewCell", bundle: nil), forCellReuseIdentifier: "secondTableViewCell") //nib 파일 등록
            tableView.register(UINib(nibName: "thridTableViewCell", bundle: nil), forCellReuseIdentifier: "thridTableViewCell") //nib 파일 등록
            tableView.register(UINib(nibName: "fourthTableViewCell", bundle: nil), forCellReuseIdentifier: "fourthTableViewCell") //nib 파일 등록
        }
        
        
        //MARK: - 네비게이션 바 버튼 관련
        //중앙주소버튼
        locationBtn.setTitle(Location.titleLocation + " ", for: .normal)
 
    }
    //MARK: - 네비게이션바 없애기
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationController?.setNavigationBarHidden(true, animated: animated)
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            self.navigationController?.setNavigationBarHidden(false, animated: animated)
        }
    
    @objc func clickOnButton() {
        print("click")
    }
    //MARK: - 네비게이션바에 오른쪽에 버튼1 화면전환
    
    @IBAction func didTapAlarmBtn(_ sender: Any) {
        let alStoryboard = UIStoryboard(name: "AlarmStoryboard", bundle: nil) //스토리보드 결정
        let alarmVC = alStoryboard.instantiateViewController(identifier: "AlarmViewController")
        self.navigationController?.pushViewController(alarmVC, animated: true)
    }
    //MARK: - 네이비게이션바에 오른쪽에 버튼2 화면전환
    @IBAction func didTapMyBaeminBtn(_ sender: Any) {
        let myStoryboard = UIStoryboard(name: "MyBeaminStoryboard", bundle: nil) //스토리보드 결정
        let myBeaminVC = myStoryboard.instantiateViewController(identifier: "MyBeaminViewController")
        self.navigationController?.pushViewController(myBeaminVC, animated: true)
    }
    

    
}

//MARK: - hex Color
extension MainViewController {
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
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //cell의 갯수 설정
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //cell의 데이터 구성
        //firstTableViewCell
        
        
        switch indexPath.row {

        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstTableViewCell", for: indexPath) as! firstTableViewCell
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondTableViewCell", for: indexPath) as! secondTableViewCell
            cell.configure(with: models)
//            cell.selectionStyle = .none
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "fourthTableViewCell", for: indexPath) as! fourthTableViewCell
            cell.configure(with: models3)
//            cell.selectionStyle = .none
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "thridTableViewCell", for: indexPath) as! thridTableViewCell
            cell.configure(with: models2)
            cell.selectionStyle = .none
            return cell
        
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { //cell의 높이 설정
                
        switch indexPath.row {
        case 0:
            return 55
        case 1:
            return 755
        case 2:
            return 320
        case 3:
            return 235
        default:
            return 100
        }
    }
   
    
}
