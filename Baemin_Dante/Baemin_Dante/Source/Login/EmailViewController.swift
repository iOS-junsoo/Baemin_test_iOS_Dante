//
//  EmailViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/01.
//

import UIKit
import Toast_Swift

class EmailViewController: UIViewController {

    @IBOutlet var jungbokBtn: UIButton!
    @IBOutlet var pwTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var emailCheck: UIImageView!
    @IBOutlet var nicknameCheck: UIImageView!
    @IBOutlet var passwordCheck: UIImageView!
    @IBOutlet var completeBtn: UIButton!
    @IBOutlet var emailErrorLabel: UILabel!
    @IBOutlet var nicknameErrorLabel: UILabel!
    @IBOutlet var passwordErrorLabel: UILabel!
    var pwCount = 0
    var emailState = false
    var nicknameState = false
    var passwordState = false
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - navigationbar back button hide
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        //MARK: - 에러메세지 숨기기
        emailErrorLabel.textColor = UIColor.white
        nicknameErrorLabel.textColor = UIColor.white
        passwordErrorLabel.textColor = UIColor.white
        
        //MARK: - 텍스트필드
        emailTextField.delegate = self
        nicknameTextField.delegate = self
        pwTextField.delegate = self
        
        jungbokBtn.layer.cornerRadius = 2
        jungbokBtn.layer.borderWidth = 0.3
        jungbokBtn.layer.borderColor = UIColor.gray.cgColor
        pwTextField.isSecureTextEntry = true //비밀번호 *로 표시하기
        self.emailTextField.addTarget(self, action: #selector(self.emailTextFieldDidChange(_:)), for: .editingChanged)
        self.nicknameTextField.addTarget(self, action: #selector(self.nicknameTextFieldDidChange(_:)), for: .editingChanged)
        self.pwTextField.addTarget(self, action: #selector(self.passwordTextFieldDidChange(_:)), for: .editingChanged)
//        completeBtn.isEnabled = false //완료버튼 비활성화
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func noSecureBtn(_ sender: UIButton) {
        pwCount = pwCount + 1
        if pwCount % 2 == 1{
            pwTextField.isSecureTextEntry = false //비밀번호 *로 표시 해제하기
        } else {
            pwTextField.isSecureTextEntry = true //비밀번호 *로 표시하기
        }
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func jungbokBtn(_ sender: UIButton) { //이후 이메일 중복 체크시 이미지가 변경되도록 조건문 추가해야함
        EmailRequest().postData()
        print("중복")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
            print("3초")
            if EmailSeverResponse.ResponseValue == true { 
                print("허용")
                self.emailCheck.image = UIImage(named: "초록체크") //응답이 true라면
                self.emailErrorLabel.textColor = UIColor.white
            } else{
                print("허용x")
                self.emailCheck.image = UIImage(named: "회색체크")
                self.emailErrorLabel.textColor = UIColor.red //응답이 false라면
            }
        }
            
        
        print("중복1")
        
    }
    
    //MARK: - 텍스트 필드 입력 감지
    @objc func emailTextFieldDidChange(_ sender: Any?) {
        UserInfo.email = emailTextField.text!
        emailState = true
        
        if emailTextField.text?.count ?? 0 > 0{
            jungbokBtn.titleLabel?.textColor = .black
        } else {
            jungbokBtn.titleLabel?.textColor = hexStringToUIColor(hex: "#D7D7D7")
        }
    }
    
    @objc func nicknameTextFieldDidChange(_ sender: Any?) {
        UserInfo.nickName = nicknameTextField.text!
        if nicknameTextField.text?.count ?? 0 > 1 && nicknameTextField.text?.count ?? 0 < 11 {
            nicknameCheck.image = UIImage(named: "초록체크")
            nicknameErrorLabel.textColor = UIColor.white
            nicknameState = true
        } else {
            nicknameCheck.image = UIImage(named: "회색체크")
            nicknameState = false
        }
    }
    
    @objc func passwordTextFieldDidChange(_ sender: Any?) {
        UserInfo.passWord = pwTextField.text!
        if pwTextField.text?.count ?? 0 > 10  {
            passwordCheck.image = UIImage(named: "초록체크")
            passwordErrorLabel.textColor = UIColor.white
            passwordState = true//완료버튼 활성화 
        } else {
            passwordCheck.image = UIImage(named: "회색체크")
            passwordState = false
        }
       
        
        
        if emailState == true && nicknameState == true && passwordState == true {
            completeBtn.titleLabel?.textColor = hexStringToUIColor(hex: "#00BEC1")
            
        } else {
            completeBtn.titleLabel?.textColor = hexStringToUIColor(hex: "#D7D7D7")
        }
        
    }
    
    @IBAction func completeBtn(_ sender: UIButton) {
        if emailState == true && nicknameState == true && passwordState == true {
            completeBtn.titleLabel?.textColor = hexStringToUIColor(hex: "#00BEC1")
            completeBtn.isEnabled = true
            JoinRequest().postData()
            print(UserInfo.email)
            LoginSeverResponse.ResponseNickName = UserInfo.nickName
            MBDataModel.MBNickName = UserInfo.nickName
            MBDataModel.MBEmail = UserInfo.email
            print(UserInfo.passWord)
            print(UserInfo.phoneNumber)
            print(UserInfo.nickName)
            LoginSeverResponse.ResponseNickName = UserInfo.nickName
            print(JoinCheck.agreementCollection)
            print(JoinCheck.agreementProvision)
            print(JoinCheck.agreementMail)
            print(JoinCheck.agreementSMS)
            print(JoinCheck.over14)
            
            LoginCheckModel.loginCheck = true
            self.view.makeToast("회원가입이 완료되었습니다.", duration: 2.0, position: .center)
            dismiss(animated: true, completion: nil)
        }
    }
    
    //MARK: - 텍스트 필드 글자수 제한 함수
    func checkMaxLength(textField: UITextField!, maxLength: Int) {
            if (textField.text?.count ?? 0 > maxLength) {
                textField.deleteBackward()
            }
        }
        
    

}

extension EmailViewController {
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

extension EmailViewController: UITextFieldDelegate {

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // return NO to disallow editing.
        print("TextField should begin editing method called")
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        // became first responder
        print("TextField did begin editing method called")
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
        print("TextField should snd editing method called")
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
        print("TextField did end editing method called")
    }

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        // if implemented, called in place of textFieldDidEndEditing:
        print("TextField did end editing with reason method called")
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // return NO to not change text
        print("While entering the characters this method gets called")
        return true
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        // called when clear button pressed. return NO to ignore (no notifications)
        print("TextField should clear method called")
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool { //리턴키 입력시 호출
        // called when 'return' key pressed. return NO to ignore.
        print("TextField should return method called")
        if pwTextField.text?.count ?? 0 < 10 && pwTextField.text?.count ?? 0 > 0 {
            passwordErrorLabel.textColor = UIColor.red
        }
        if nicknameTextField.text?.count ?? 0 < 2 {
            nicknameErrorLabel.textColor = UIColor.red
        } else if nicknameTextField.text?.count ?? 0 > 11{
            nicknameErrorLabel.textColor = UIColor.red
        }
        
        
        textField.resignFirstResponder()
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { //다른 화면 터치시 호출
        self.view.endEditing(true) //키보드 내림
        if pwTextField.text?.count ?? 0 < 10 && pwTextField.text?.count ?? 0 > 0 {
            passwordErrorLabel.textColor = UIColor.red
        }
        if nicknameTextField.text?.count ?? 0 < 2 {
            nicknameErrorLabel.textColor = UIColor.red
            print("레드레드")
        } else if nicknameTextField.text?.count ?? 0 > 11{
            nicknameErrorLabel.textColor = UIColor.red
        }
    }

}

