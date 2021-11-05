//
//  LoginViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/10/31.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class LoginViewController: UIViewController {

    @IBOutlet var idTextField: UITextField!
    @IBOutlet var pwTextField: UITextField!
    @IBOutlet var kakaoLoginBtn: UIButton!
    @IBOutlet var loginErrorLabel: UILabel!
    var loginErrorCount = 5
    override func viewDidLoad() {
        super.viewDidLoad()
        pwTextField.isSecureTextEntry = true
        
        loginErrorLabel.textColor = UIColor.white
        
        //MARK: - navigationbar back button hide
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        idTextField.delegate = self
        pwTextField.delegate = self
        
        self.idTextField.addTarget(self, action: #selector(self.IdTextFieldDidChange(_:)), for: .editingChanged)
        self.pwTextField.addTarget(self, action: #selector(self.PwTextFieldDidChange(_:)), for: .editingChanged)

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if Check.dis == 1 {
            Check.dis = 0
            dismiss(animated: true, completion: nil)
        }
    }
   
    //MARK: - 카카오로그인 기능구현
    @IBAction func kakaoLoginBtn(_ sender: UIButton) {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
           if let error = error {
               print(error)
           }
           else {
               //로그인 성공후 사용자 정보 가져오기
               UserApi.shared.me() {(user, error) in
                   if let error = error {
                       print(error)
                   }
                   else {
                       
                       KakaoLogin.userName = (user?.kakaoAccount?.profile?.nickname!)! //사용자의 이름
                       KakaoLogin.userEmail = (user?.kakaoAccount?.email!)! //사용자의 이메일
//                       let url = user?.kakaoAccount?.profile?.profileImageUrl
//                       let data = try? Data(contentsOf: url!)
//                       self.userImage.image = UIImage(data: data!)
                       self.nextCheckBox() //약관동의 화면으로 넘어감
                       _ = user
                   }
               }
               print("loginWithKakaoAccount() success.")
                _ = oauthToken
         }
     }
    }
    

    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - 텍스트 필드 입력감지
    @objc func IdTextFieldDidChange(_ sender: Any?) {
        Login.id = idTextField.text!
    }
    
    @objc func PwTextFieldDidChange(_ sender: Any?) {
        Login.pw = pwTextField.text!
    }
    
    func nextCheckBox() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "CheckBoxViewController") as? CheckBoxViewController {
            
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
            
        }
    }
    @IBAction func LoginBtn(_ sender: UIButton) {
        LoginRequest().postData()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
            if LoginSeverResponse.ResponseValue == true {
                self.dismiss(animated: true, completion: nil)
                //이후 사용자 정보를 마이배민 화면에서 나타내야함
                self.loginErrorLabel.textColor = UIColor.white
                print("성공")
            } else {
                self.loginErrorCount -= 1
                self.loginErrorLabel.text = "계정 정보가 일치하지 않습니다.(\(self.loginErrorCount)회 남음)"
                self.loginErrorLabel.textColor = UIColor.red
                if self.loginErrorCount == 0 { //5번 비밀번호를 틀렸을 때
                    self.loginErrorLabel.text = "계정이 잠겼습니다. 비밀번호 찾기를 통해 새로운 비밀번호를 받으세요."
                }
            }
        }
    }
    
    

}

extension LoginViewController: UITextFieldDelegate {

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
        textField.resignFirstResponder()
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { //다른 화면 터치시 호출
        self.view.endEditing(true) //키보드 내림
        
    }

}
