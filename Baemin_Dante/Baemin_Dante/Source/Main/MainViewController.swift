//
//  ViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/10/30.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var baeminView: UIView!

    @IBOutlet var tableView: UITableView!
    
    //MARK: - 데이터 모델
    var models = [Model]()
    var models2 = [Model2]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        setUpTableView()
        //MARK: - 바 버튼 아이템 간격조절
        //이미지 생성
        var alarmImage = UIImage(named: "홈_오른쪽버튼1")
        var myBaeminImage = UIImage(named: "홈_오른쪽버튼2")
        //버튼 생성
        let alarmButton: UIButton = UIButton.init(type: .custom)
        alarmButton.setImage(alarmImage, for: .normal)
        alarmButton.addTarget(self, action: #selector(didTapAlarmBtn), for: .touchUpInside)
        alarmButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let barAlarmButton = UIBarButtonItem(customView: alarmButton)
        
        let myBaeminButton: UIButton = UIButton.init(type: .custom)
        myBaeminButton.setImage(myBaeminImage, for: .normal)
        myBaeminButton.addTarget(self, action: #selector(didTapmyBaeminBtn), for: .touchUpInside)
        myBaeminButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        myBaeminButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let barMyBaeminButton = UIBarButtonItem(customView: myBaeminButton)
        //바 버튼 추가
       
        self.navigationItem.setRightBarButtonItems([barMyBaeminButton, barAlarmButton], animated: false)
        func setUpTableView() {
            models.append(Model(imageName: "광고1"))
            models.append(Model(imageName: "광고2"))
            models.append(Model(imageName: "광고3"))
            
            models2.append(Model2(imageName: "오늘광고1"))
            models2.append(Model2(imageName: "오늘광고2"))
            models2.append(Model2(imageName: "오늘광고3"))
            
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: "firstTableViewCell", bundle: nil), forCellReuseIdentifier: "firstTableViewCell") //nib 파일 등록
            tableView.register(UINib(nibName: "secondTableViewCell", bundle: nil), forCellReuseIdentifier: "secondTableViewCell") //nib 파일 등록
            tableView.register(UINib(nibName: "thridTableViewCell", bundle: nil), forCellReuseIdentifier: "thridTableViewCell") //nib 파일 등록
        }

        
        //MARK: - 네이게이션바 색
//        self.navigationController?.navigationBar.backgroundColor = self.hexStringToUIColor(hex: "2DC0BD")
//        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        //MARK: - 네비게이션바에 버튼 삽입하기
        let button =  UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15.0, weight: .bold) //버튼 폰트
        button.setTitle(Location.titleLocation, for: .normal)
        button.addTarget(self, action: #selector(clickOnButton), for: .touchUpInside)
        navigationItem.titleView = button
        
    }
    
    @objc func clickOnButton() {
        print("click")
    }
    
    @objc func didTapAlarmBtn() {
        let alStoryboard = UIStoryboard(name: "AlarmStoryboard", bundle: nil) //스토리보드 결정
        let alarmVC = alStoryboard.instantiateViewController(identifier: "AlarmViewController")
        self.navigationController?.pushViewController(alarmVC, animated: true)
    }
    
    @objc func didTapmyBaeminBtn() {
        //MARK: - 네이비게이션 컨트롤러를 이용해서 화면전환
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
        return 3
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
            cell.selectionStyle = .none
            return cell
        case 2:
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
            return 235
        default:
            return 100
        }
    }
   
    
}
