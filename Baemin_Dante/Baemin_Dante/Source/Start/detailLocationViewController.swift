//
//  detailLocationViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/10/31.
//

import UIKit


class detailLocationViewController: UIViewController {

    @IBOutlet var detalilLocationTextField: UITextField!
    @IBOutlet var LocationLabel: UILabel!
    @IBOutlet var myView: UIImageView!
    @IBOutlet var jidoBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - navigationbar back button hide
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        jidoBtn.adjustsImageWhenHighlighted = false
        LocationLabel.text = Location.titleLocation
        print("위치명:::\(Location.titleLocation)")
        self.detalilLocationTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged) //함수 연결
        //MARK: TextField
        detalilLocationTextField.delegate = self
        self.myView.isUserInteractionEnabled = true
        self.myView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.viewTapped)))
        self.myView.frame =  CGRect(x: 16, y: 161.5, width: 360, height: 52)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    //MARK: 이미지뷰가 클릭되면 호출
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        print("클릭됨")
        ZoomIn()
        detalilLocationTextField.becomeFirstResponder() //키보드 올리기
    }
    //MARK: 텍스트필드 애니메이션
    func ZoomIn() {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.myView.frame = CGRect(x: 28, y: 157, width: 83, height: 15)
            self.myView.image = UIImage(named: "상세주소입력미니")
        }, completion: nil
           
        )
        myView.layer.borderColor = UIColor.white.cgColor
    }
    
    func ZoomOut() {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.myView.frame =  CGRect(x: 16, y: 161.5, width: 360, height: 52)
            self.myView.image = UIImage(named: "상세주소입력")
        }, completion: nil
           
        )
        myView.layer.borderColor = UIColor.black.cgColor
    }
    
    //MARK: - 텍스트 필드의 값이 변경되면 이 메서드가 호출된다.
    @objc func textFieldDidChange(_ sender: Any?) {
        Location.detailLocation = detalilLocationTextField.text!
        //TextField에 입력된 상세 주소를 Location.detailLocation에 저장
        }
    
    
    @IBAction func saveLocation(_ sender: UIButton) {
        Location.totalLocation = Location.titleLocation + " " + Location.detailLocation

    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func jido(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension detailLocationViewController: UITextFieldDelegate {

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
        if detalilLocationTextField.text?.count == 0 {
            ZoomOut()
            
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { //다른 화면 터치시 호출
        self.view.endEditing(true) //키보드 내림
        if detalilLocationTextField.text?.count == 0 {
            ZoomOut()
            
        }
    }

}
