//
//  CheckBoxViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/10/31.
//

import UIKit
import Toast_Swift

class CheckBoxViewController: UIViewController {

    @IBOutlet var allCheckBtn: UIButton!
    @IBOutlet var must1Btn: UIButton!
    @IBOutlet var must2Btn: UIButton!
    @IBOutlet var must3Btn: UIButton!
    @IBOutlet var choice1Btn: UIButton!
    @IBOutlet var choice2Btn: UIButton!
    @IBOutlet var choice3Btn: UIButton!
    @IBOutlet var nextBtn: UIButton!
    @IBOutlet var fourthBtn: UIButton!
    var must1 = false
    var must2 = false
    var must3 = false
    var allCheckBtnCount = 0
    var must1Count = 0
    var must2Count = 0
    var must3Count = 0
    var choice1Count = 0
    var choice2Count = 0
    var choice3Count = 0
    var fourteenCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - navigationbar back button hide
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        
        fourthBtn.adjustsImageWhenHighlighted = false
        
        //MARK: - 모든 버튼 기본값으로 변경
        self.allCheckBtn.setImage(UIImage(named: "체크X"), for: .normal)
        self.must1Btn.setImage(UIImage(named: "체크X"), for: .normal)
        self.must2Btn.setImage(UIImage(named: "체크X"), for: .normal)
        self.must3Btn.setImage(UIImage(named: "체크X"), for: .normal)
        self.choice1Btn.setImage(UIImage(named: "체크X"), for: .normal)
        self.choice2Btn.setImage(UIImage(named: "체크X"), for: .normal)
        self.choice3Btn.setImage(UIImage(named: "체크X"), for: .normal)
        self.nextBtn.setImage(UIImage(named: "다음으로X"), for: .normal)
        self.nextBtn.adjustsImageWhenHighlighted = false
    }
    //MARK: - 네비게이션 바 숨기기
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func allCheckTap(_ sender: UIButton) {
        allCheckBtnCount = allCheckBtnCount + 1
        if allCheckBtnCount % 2 == 1 {
            self.allCheckBtn.setImage(UIImage(named: "체크O"), for: .normal)
            self.must1Btn.setImage(UIImage(named: "체크O"), for: .normal)
            self.must2Btn.setImage(UIImage(named: "체크O"), for: .normal)
            self.must3Btn.setImage(UIImage(named: "체크O"), for: .normal)
            self.choice1Btn.setImage(UIImage(named: "체크O"), for: .normal)
            self.choice2Btn.setImage(UIImage(named: "체크O"), for: .normal)
            self.choice3Btn.setImage(UIImage(named: "체크O"), for: .normal)
            self.nextBtn.setImage(UIImage(named: "다음으로O"), for: .normal)
            must1 = true
            must2 = true
            must3 = true
            JoinCheck.agreementCollection = "1"
            JoinCheck.agreementProvision = "1"
            JoinCheck.agreementMail = "1"
            JoinCheck.agreementSMS = "1"
        } else{
            self.allCheckBtn.setImage(UIImage(named: "체크X"), for: .normal)
            self.must1Btn.setImage(UIImage(named: "체크X"), for: .normal)
            self.must2Btn.setImage(UIImage(named: "체크X"), for: .normal)
            self.must3Btn.setImage(UIImage(named: "체크X"), for: .normal)
            self.choice1Btn.setImage(UIImage(named: "체크X"), for: .normal)
            self.choice2Btn.setImage(UIImage(named: "체크X"), for: .normal)
            self.choice3Btn.setImage(UIImage(named: "체크X"), for: .normal)
            self.nextBtn.setImage(UIImage(named: "다음으로X"), for: .normal)
            must1 = false
            must2 = false
            must3 = false
            JoinCheck.agreementCollection = "0"
            JoinCheck.agreementProvision = "0"
            JoinCheck.agreementMail = "0"
            JoinCheck.agreementSMS = "0"
        }
        
    }
    @IBAction func must1Tap(_ sender: UIButton) {
        if allCheckBtnCount % 2 == 1 { //전체 동의를 눌렀다면
            must1Count = must1Count + 1
            if must1Count % 2 == 0{
                self.must1Btn.setImage(UIImage(named: "체크O"), for: .normal)
                must1 = true
            } else {
                self.must1Btn.setImage(UIImage(named: "체크X"), for: .normal)
                self.nextBtn.setImage(UIImage(named: "다음으로X"), for: .normal)
                must1 = false
            }
            if must1 == true && must2 == true && must3 == true && fourteenCount % 2 == 1{
                self.nextBtn.setImage(UIImage(named: "다음으로O"), for: .normal)
            }
        } else{
            must1Count = must1Count + 1
            if must1Count % 2 == 1{
                self.must1Btn.setImage(UIImage(named: "체크O"), for: .normal)
                must1 = true
            } else {
                self.must1Btn.setImage(UIImage(named: "체크X"), for: .normal)
                self.nextBtn.setImage(UIImage(named: "다음으로X"), for: .normal)
                must1 = false
            }
            if must1 == true && must2 == true && must3 == true && fourteenCount % 2 == 1{
                self.nextBtn.setImage(UIImage(named: "다음으로O"), for: .normal)
            }
        }
    }
    @IBAction func must2Tap(_ sender: UIButton) {
        if allCheckBtnCount % 2 == 1 { //전체 동의를 눌렀다면
            must2Count = must2Count + 1
            if must2Count % 2 == 0{
                self.must2Btn.setImage(UIImage(named: "체크O"), for: .normal)
                
                must2 = true
            } else {
                self.must2Btn.setImage(UIImage(named: "체크X"), for: .normal)
                self.nextBtn.setImage(UIImage(named: "다음으로X"), for: .normal)
                must2 = false
            }
            if must1 == true && must2 == true && must3 == true && fourteenCount % 2 == 1{
                self.nextBtn.setImage(UIImage(named: "다음으로O"), for: .normal)
            }
        } else{
            must2Count = must2Count + 1
            if must2Count % 2 == 1{
                self.must2Btn.setImage(UIImage(named: "체크O"), for: .normal)
                
                must2 = true
            } else {
                self.must2Btn.setImage(UIImage(named: "체크X"), for: .normal)
                self.nextBtn.setImage(UIImage(named: "다음으로X"), for: .normal)
                must2 = false
            }
            if must1 == true && must2 == true && must3 == true && fourteenCount % 2 == 1{
                self.nextBtn.setImage(UIImage(named: "다음으로O"), for: .normal)
            }
        }
    }
    @IBAction func must3Tap(_ sender: UIButton) {
        if allCheckBtnCount % 2 == 1 { //전체 동의를 눌렀다면
            must3Count = must3Count + 1
            if must3Count % 2 == 0{
                self.must3Btn.setImage(UIImage(named: "체크O"), for: .normal)
                must3 = true
            } else {
                self.must3Btn.setImage(UIImage(named: "체크X"), for: .normal)
                self.nextBtn.setImage(UIImage(named: "다음으로X"), for: .normal)
                must3 = false
            }
            if must1 == true && must2 == true && must3 == true && fourteenCount % 2 == 1{
                self.nextBtn.setImage(UIImage(named: "다음으로O"), for: .normal)
            }
        
        } else {
            must3Count = must3Count + 1
            if must3Count % 2 == 1{
                self.must3Btn.setImage(UIImage(named: "체크O"), for: .normal)
                must3 = true
            } else {
                self.must3Btn.setImage(UIImage(named: "체크X"), for: .normal)
                self.nextBtn.setImage(UIImage(named: "다음으로X"), for: .normal)
                must3 = false
            }
            if must1 == true && must2 == true && must3 == true && fourteenCount % 2 == 1{
                self.nextBtn.setImage(UIImage(named: "다음으로O"), for: .normal)
            }
        }
    }
    @IBAction func choice1Tap(_ sender: UIButton) {
        if allCheckBtnCount % 2 == 1 { //전체 동의를 눌렀다면
            choice1Count = choice1Count + 1
            if choice1Count % 2 == 0 {
                self.choice1Btn.setImage(UIImage(named: "체크O"), for: .normal)
                JoinCheck.agreementCollection = "1"
            } else {
                self.choice1Btn.setImage(UIImage(named: "체크X"), for: .normal)
                JoinCheck.agreementCollection = "0"
            }
            if must1 == true && must2 == true && must3 == true && fourteenCount % 2 == 1{
                self.nextBtn.setImage(UIImage(named: "다음으로O"), for: .normal)
            }
        } else {
            choice1Count = choice1Count + 1
            if choice1Count % 2 == 1 {
                self.choice1Btn.setImage(UIImage(named: "체크O"), for: .normal)
                JoinCheck.agreementCollection = "1"
            } else {
                self.choice1Btn.setImage(UIImage(named: "체크X"), for: .normal)
                JoinCheck.agreementCollection = "0"
            }
            if must1 == true && must2 == true && must3 == true && fourteenCount % 2 == 1{
                self.nextBtn.setImage(UIImage(named: "다음으로O"), for: .normal)
            }
        }
    }
    @IBAction func choice2Tap(_ sender: UIButton) {
        if allCheckBtnCount % 2 == 1 { //전체 동의를 눌렀다면
            choice2Count = choice2Count + 1
            if choice2Count % 2 == 0 {
                self.choice2Btn.setImage(UIImage(named: "체크O"), for: .normal)
                JoinCheck.agreementProvision = "1"
            } else {
                self.choice2Btn.setImage(UIImage(named: "체크X"), for: .normal)
                JoinCheck.agreementProvision = "0"
            }
            if must1 == true && must2 == true && must3 == true && fourteenCount % 2 == 1{
                self.nextBtn.setImage(UIImage(named: "다음으로O"), for: .normal)
            }
        } else {
            choice2Count = choice2Count + 1
            if choice2Count % 2 == 1 {
                self.choice2Btn.setImage(UIImage(named: "체크O"), for: .normal)
                JoinCheck.agreementProvision = "1"
            } else {
                self.choice2Btn.setImage(UIImage(named: "체크X"), for: .normal)
                JoinCheck.agreementProvision = "0"
            }
            if must1 == true && must2 == true && must3 == true && fourteenCount % 2 == 1{
                self.nextBtn.setImage(UIImage(named: "다음으로O"), for: .normal)
            }
        }
    }
    @IBAction func choice3Tap(_ sender: UIButton) {
        
        if allCheckBtnCount % 2 == 1 { //전체 동의를 눌렀다면
            choice3Count = choice3Count + 1
            if choice3Count % 2 == 0 {
                self.choice3Btn.setImage(UIImage(named: "체크O"), for: .normal)
                JoinCheck.agreementMail = "1"
                JoinCheck.agreementSMS = "1"
            } else {
                self.choice3Btn.setImage(UIImage(named: "체크X"), for: .normal)
                JoinCheck.agreementMail = "0"
                JoinCheck.agreementSMS = "0"
            }
            if must1 == true && must2 == true && must3 == true && fourteenCount % 2 == 1{
                self.nextBtn.setImage(UIImage(named: "다음으로O"), for: .normal)
            }
        } else {
            choice3Count = choice3Count + 1
            if choice3Count % 2 == 1 {
                self.choice3Btn.setImage(UIImage(named: "체크O"), for: .normal)
                JoinCheck.agreementMail = "1"
                JoinCheck.agreementSMS = "1"
            } else {
                self.choice3Btn.setImage(UIImage(named: "체크X"), for: .normal)
                JoinCheck.agreementMail = "0"
                JoinCheck.agreementSMS = "0"
            }
            if must1 == true && must2 == true && must3 == true && fourteenCount % 2 == 1{
                self.nextBtn.setImage(UIImage(named: "다음으로O"), for: .normal)
            }
        }
    }
    @IBAction func nextBtnTap(_ sender: UIButton) {
        if must1 == true && must2 == true && must3 == true && fourteenCount % 2 == 1{
//            guard let SelfVC = self.storyboard?.instantiateViewController(withIdentifier: "SelfCertificationViewController") as? SelfCertificationViewController else{ return }
//            SelfVC.modalTransitionStyle = .coverVertical
//            SelfVC.modalPresentationStyle = .fullScreen
//            self.present(SelfVC, animated: true, completion: nil)
            if let SelfVC = self.storyboard?.instantiateViewController(withIdentifier: "SelfCertificationViewController") as? SelfCertificationViewController {
            self.navigationController?.pushViewController(SelfVC, animated: true)
            }

        }
        if fourteenCount % 2 == 0 { //사용자가 14세 이상을 선택하지 않고 다음으로 버튼을 누를 때
            self.showToast(message: "14세 미만은 회원가입을 진행할 수 없습니다.")
        }
        
    }
    
    func showToast(message : String, font: UIFont = UIFont.systemFont(ofSize: 17.0)) {
        let toastLabel = UILabel(frame: CGRect(x: 32, y: 401, width: 327, height: 43))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds = true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: { toastLabel.alpha = 0.0
            
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
            
        })
        
    }

    
    //로그인 화면으로 다시 돌아감
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
        dismiss(animated: true)
    }

    @IBAction func fourteen(_ sender: UIButton) {
        fourteenCount += 1
        if fourteenCount % 2 == 1 {
            fourthBtn.setImage(UIImage(named: "14세이상"), for: .normal)
            JoinCheck.over14 = "1"
        } else {
            fourthBtn.setImage(UIImage(named: "14세이하"), for: .normal)
            JoinCheck.over14 = "0"
        }
    }
    

}

//MARK: - hex Color
extension CheckBoxViewController {
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
