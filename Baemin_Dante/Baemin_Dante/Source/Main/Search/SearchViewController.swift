//
//  SearchViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/04.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet var SearchTF: UITextField!
    @IBOutlet var tableView: UITableView!
    var models2 = [FastModel1]()
    var check = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchTF.delegate = self
        //MARK: - navigationbar back button hide
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.SearchTF.addTarget(self, action: #selector(self.SearchTFDidChange(_:)), for: .editingChanged)
        SearchRequest().getData()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
            self.setUpTableView()
            print("adadadas")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationController?.setNavigationBarHidden(true, animated: animated)
        }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    func setUpTableView() {
        
            models2.append(FastModel1(imageName: "송토육개장", title: "송토 육개장", star: "4.8", review: "(50+)", menu: "육개장, 굴육개장", OrderPay: "최소주문 15,000원, 배달팁 3,000원", deliveryPay: "3,000원", deliveryTime: "49~64분"))
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: "advertisementTableViewCell", bundle: nil), forCellReuseIdentifier: "advertisementTableViewCell") //nib 파일 등록
           
            tableView.register(UINib(nibName: "OpenListTableViewCell", bundle: nil), forCellReuseIdentifier: "OpenListTableViewCell") //nib 파일
            print("1111113")
        
        
        

        
    }
    @IBAction func backBtn(_ sender: UIButton) {
//            self.navigationController?.popToRootViewController(animated: true)
        self.navigationController?.popViewController(animated: true)
        }

    @objc func SearchTFDidChange(_ sender: Any?) {
        
        if SearchTF.text?.count ?? 0 > 0{
            SearchModel.search = SearchTF.text!
            
        } else {
           
        }
    }
    
}


extension SearchViewController: UITextFieldDelegate {

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
        if SearchTF.text?.count ?? 0 > 0{
            SearchRequest().getData()
            check = 1
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
                self.models2.append(FastModel1(imageName: SearchModel.model[0].image!, title: SearchModel.model[0].name!, star: "\(SearchModel.model[0].avg_star!)", review: "(\(SearchModel.model[0].review_cnt!))", menu: SearchModel.model[0].two_menus!, OrderPay: "최소주문 \(SearchModel.model[0].min_order_price!)원, \(SearchModel.model[0].min_delivery_fee!)원", deliveryPay: "", deliveryTime: "31~46분"))
                self.tableView.reloadData()
            }
        }
        
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { //다른 화면 터치시 호출
        self.view.endEditing(true) //키보드 내림
        
    }

}
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //cell의 데이터 구성
        
        if check == 0 {
//            let cellDataContent1 = models2[0]
//            let cell = tableView.dequeueReusableCell(withIdentifier: "OpenListTableViewCell") as! OpenListTableViewCell
//            let url = URL(string: cellDataContent1.imageName)
//            let data = try? Data(contentsOf: url!)
//            cell.imagName.image = UIImage(data: data!)
//            cell.title.text = cellDataContent1.title
//
//            cell.star.text = cellDataContent1.star
//            cell.review.text = cellDataContent1.review
//            cell.menu.text = cellDataContent1.menu
//            cell.orderPay.text = cellDataContent1.OrderPay
//            cell.orderTime.setTitle(cellDataContent1.deliveryTime, for: .normal)
//            cell.selectionStyle = .none
//            return cell
            return UITableViewCell()
            print("Asdadadadas")
        } else if check == 1 {
            let cellDataContent1 = models2[0+check]
            let cell = tableView.dequeueReusableCell(withIdentifier: "OpenListTableViewCell") as! OpenListTableViewCell
            let url = URL(string: cellDataContent1.imageName) //
            let data = try? Data(contentsOf: url!)
            cell.imagName.image = UIImage(data: data!)
            cell.title.text = cellDataContent1.title
            
            cell.star.text = cellDataContent1.star
            cell.review.text = cellDataContent1.review
            cell.menu.text = cellDataContent1.menu
            cell.orderPay.text = cellDataContent1.OrderPay
            cell.orderTime.setTitle(cellDataContent1.deliveryTime, for: .normal)
            cell.selectionStyle = .none
            return cell
            print("Asdadadadas")
        }
        return UITableViewCell()
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { //cell의 높이 설정
        
        return 125
        
    }


    //cell을 클릭했는지 확인해주는 메소드
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 한 가게만 구현하기 때문에 따로 indexPath.row에 따라서 나누어 주진 않았다.
        let alStoryboard = UIStoryboard(name: "BacisNextStoryboard", bundle: nil) //스토리보드 결정
        let alarmVC = alStoryboard.instantiateViewController(identifier: "BasicNextViewController")
        self.navigationController?.pushViewController(alarmVC, animated: true)
    }
    
    
}
