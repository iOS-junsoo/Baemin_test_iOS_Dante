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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LocationLabel.text = Location.titleLocation
        self.detalilLocationTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged) //함수 연결
        
        
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
        dismiss(animated: true, completion: nil)
    }
    
}
