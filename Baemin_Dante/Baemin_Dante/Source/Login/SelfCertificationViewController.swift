//
//  SelfCertificationViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/10/31.
//

import UIKit
import AnyFormatKit

class SelfCertificationViewController: UIViewController {

    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var phoneBtn: UIButton!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var pheneCheckImage: UIImageView!
    @IBOutlet var numberCheckImage: UIImageView!
    @IBOutlet var nextBtn: UIButton!
    var phoneCount = 0
    var numberCount = 0
    var phoneState = false
    var numbarState = false
    var limitTime = 300 //타이머 5분설정
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.isHidden = true //타임 레이블 숨기기
        
        //MARK: - 인증번호 받기 버튼 커스텀
        phoneBtn.layer.borderWidth = 0.3
        phoneBtn.layer.borderColor = UIColor.gray.cgColor
        
        //MARK: - 텍스트 필드 커스텀

        self.phoneTextField.addTarget(self, action: #selector(self.phoneTextFieldDidChange(_:)), for: .editingChanged) //텍스트필드 입력감지하면 함수호출
        
        self.numberTextField.addTarget(self, action: #selector(self.numberTextFieldDidChange(_:)), for: .editingChanged) //텍스트필드 입력감지하면 함수호출
        
//        phoneTextField.delegate = self //하이픈 자동 입력
        
//        self.detalilLocationTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged) //함수 연결

        //MARK: - 변경 예정 변수 초기화
        
        
    }
    //MARK: - 네비게이션 바 없애기
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func textFiledno(_ sender: UITextField) {
        
    }
    //MARK: - 타이머 작동
    @IBAction func reInjeingBtn(_ sender: UIButton) {
        if phoneState == true {
            timeLabel.isHidden = false
            getSetTime()
        }
    }
    
    @IBAction func injeongBtn(_ sender: UIButton) {
        if phoneState == true {
            timeLabel.isHidden = false
            getSetTime()
        }
    }
    
    @objc func getSetTime() {
        secToTime(sec:limitTime)
        limitTime -= 1
    }
    
    func secToTime(sec:Int) {
        
        let minute = (sec % 3600) / 60
        let second = (sec % 3600) % 60
        
        if second < 10 {
            timeLabel.text = "0" + String(minute) + ":" + "0" + String(second)
        } else {
            timeLabel.text = "0" + String(minute) + ":" + String(second)
        }
        
        if limitTime != 0 {
            perform(#selector(getSetTime), with: nil, afterDelay: 1.0)
        } else if limitTime == 0 {
            timeLabel.isHidden = true
        }
            
    }
    
    
    //MARK: - 버튼 작동 함수
    @IBAction func backBtn(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    //휴대전화 함수
    @objc func phoneTextFieldDidChange(_ sender: Any?) {
            
            if phoneTextField.text?.count == 13 { //글자수가 10이면 초록색 체크로
                pheneCheckImage.image = UIImage(named: "초록체크")
                phoneBtn.tintColor = UIColor.black //버튼 색 변경
                phoneState = true
            }else {
                pheneCheckImage.image = UIImage(named: "회색체크")
                phoneBtn.tintColor = hexStringToUIColor(hex: "#D7D7D7")
            }
        checkMaxLength(textField: phoneTextField, maxLength: 13)
        UserInfo.phoneNumber = phoneTextField.text! //사용자의 전화번호를 전역변수에 저장
        }
    //인증번호 함수
    @objc func numberTextFieldDidChange(_ sender: Any?) {
            
        if numberTextField.text?.count == 4 { //글자수가 4이상이면 초록색 체크로
                numberCheckImage.image = UIImage(named: "초록체크")
                nextBtn.titleLabel?.textColor = hexStringToUIColor(hex: "#00BEC1")
            //화면전환
            numbarState = true
            } else {
                numberCheckImage.image = UIImage(named: "회색체크")
                nextBtn.titleLabel?.textColor = hexStringToUIColor(hex: "#D7D7D7")
            }
        checkMaxLength(textField: numberTextField, maxLength: 4) //텍스트 필드 글자수 제한
        }
    //MARK: - 텍스트 필드 글자수 제한 함수 
    func checkMaxLength(textField: UITextField!, maxLength: Int) {
        if (textField.text?.count ?? 0 > maxLength) {
            textField.deleteBackward()
        }
    }
    @IBAction func nextBtn(_ sender: UIButton) {
        if numbarState == true {
            if let emailVC = self.storyboard?.instantiateViewController(withIdentifier: "EmailViewController") as? EmailViewController {
            self.navigationController?.pushViewController(emailVC, animated: true)
        }
        }
    }
    


}

extension SelfCertificationViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard let text = textField.text else {
            return false
        }
        let characterSet = CharacterSet(charactersIn: string)
        if CharacterSet.decimalDigits.isSuperset(of: characterSet) == false {
            return false
        }

        let formatter = DefaultTextInputFormatter(textPattern: "###-####-####")
        let result = formatter.formatInput(currentText: text, range: range, replacementString: string)
        textField.text = result.formattedText
        let position = textField.position(from: textField.beginningOfDocument, offset: result.caretBeginOffset)!
        textField.selectedTextRange = textField.textRange(from: position, to: position)
        return false
    }
    
    
    
}

extension SelfCertificationViewController {
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
