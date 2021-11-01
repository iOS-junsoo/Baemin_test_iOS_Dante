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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func nextCheckBox() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "CheckBoxViewController") as? CheckBoxViewController {
            
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
            
        }
    }

}
