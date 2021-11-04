//
//  StartViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/10/30.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class StartViewController: UIViewController {

    @IBOutlet weak var allCheck: UIButton!
    @IBOutlet weak var localCheck: UIButton!
    @IBOutlet weak var marketCheck: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    var must = false //필수체크 상태확인 변수
    var choice = false //선택 체크 상태확인 변수
    var countAll = 0 //전체동의 버튼 클릭 횟수
    var countLocal = 0 //위치 버튼 클릭 횟수
    var countMarket = 0 //마케딩 버튼 클릭 횟수
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - 체크박스 모두 체크하기 전으로 만들기
        self.allCheck.setImage(UIImage(named: "체크X"), for: .normal)
        self.localCheck.setImage(UIImage(named: "체크X"), for: .normal)
        self.marketCheck.setImage(UIImage(named: "체크X"), for: .normal)
        self.startBtn.setImage(UIImage(named: "시작하기X"), for: .normal)
        self.startBtn.adjustsImageWhenHighlighted = false
    }
    override func viewDidAppear(_ animated: Bool) {
        //MARK: - 동의하기전 알림 허용
        let alert = UIAlertController(title: "'배달의 민족에서 알림을 보내고자 합니다.'", message: "경고, 사운드 및 아이콘 배지가 알림에 포함될 수 있습니다. 설정에서 이를 구성할 수 있습니다. ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "허용안함", style: .cancel, handler: { (_) in
            exit(0)
        }))
        alert.addAction(UIAlertAction(title: "허용", style: .default, handler: { (_) in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func allCheckClicked(_ sender: UIButton) {
        countAll = countAll + 1
        if countAll % 2 == 1 {
            self.allCheck.setImage(UIImage(named: "체크O"), for: .normal)
            self.localCheck.setImage(UIImage(named: "체크O"), for: .normal)
            self.marketCheck.setImage(UIImage(named: "체크O"), for: .normal)
            self.startBtn.setImage(UIImage(named: "시작하기O"), for: .normal)
            must = true
            choice = true
        } else {
            self.allCheck.setImage(UIImage(named: "체크X"), for: .normal)
            self.localCheck.setImage(UIImage(named: "체크X"), for: .normal)
            self.marketCheck.setImage(UIImage(named: "체크X"), for: .normal)
            self.startBtn.setImage(UIImage(named: "시작하기X"), for: .normal)
            must = false
            choice = false
        }
    }
    @IBAction func localCheckClicked(_ sender: UIButton) {
        if countAll % 2 == 1 {
            countLocal = countLocal + 1
            if countLocal % 2 == 0{
                self.localCheck.setImage(UIImage(named: "체크O"), for: .normal)
                self.startBtn.setImage(UIImage(named: "시작하기O"), for: .normal)
                must = true
            } else {
                self.localCheck.setImage(UIImage(named: "체크X"), for: .normal)
                self.startBtn.setImage(UIImage(named: "시작하기X"), for: .normal)
                must = false
            }
        } else{
            countLocal = countLocal + 1
            if countLocal % 2 == 1{
                self.localCheck.setImage(UIImage(named: "체크O"), for: .normal)
                self.startBtn.setImage(UIImage(named: "시작하기O"), for: .normal)
                must = true
            } else {
                self.localCheck.setImage(UIImage(named: "체크X"), for: .normal)
                self.startBtn.setImage(UIImage(named: "시작하기X"), for: .normal)
                must = false
            }
        }
    }
    @IBAction func marketCheckClicked(_ sender: UIButton) {
        if countAll % 2 == 1 {
            countMarket = countMarket + 1
            if countMarket % 2 == 1{
                self.marketCheck.setImage(UIImage(named: "체크O"), for: .normal)
                self.startBtn.setImage(UIImage(named: "시작하기X"), for: .normal)
                StartCheck.agreePush = 1
                choice = true
            } else {
                self.marketCheck.setImage(UIImage(named: "체크X"), for: .normal)
                self.startBtn.setImage(UIImage(named: "시작하기X"), for: .normal)
                StartCheck.agreePush = 0
                choice = false
            }
        } else{
            countMarket = countMarket + 1
            if countMarket % 2 == 0{
                self.marketCheck.setImage(UIImage(named: "체크O"), for: .normal)
                self.startBtn.setImage(UIImage(named: "시작하기X"), for: .normal)
                StartCheck.agreePush = 1
                choice = true
            } else {
                self.marketCheck.setImage(UIImage(named: "체크X"), for: .normal)
                self.startBtn.setImage(UIImage(named: "시작하기X"), for: .normal)
                StartCheck.agreePush = 0
                choice = false
            }
        }
        
        
    }
    @IBAction func startBtnClicked(_ sender: UIButton) {
        if must == true{
            guard let naviVC = self.storyboard?.instantiateViewController(withIdentifier: "naviViewController") as? naviViewController else{ return }
            naviVC.modalTransitionStyle = .coverVertical
            naviVC.modalPresentationStyle = .formSheet
            self.present(naviVC, animated: true, completion: nil)
            print("next")
        }
    }
    

}
