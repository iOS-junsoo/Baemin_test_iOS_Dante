//
//  MenuViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/08.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet var topTableView: UITableView!
    @IBOutlet var bottomTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        topTableView.delegate = self
        topTableView.dataSource = self
        topTableView.alwaysBounceHorizontal = false
        topTableView.backgroundColor = UIColor.clear
        topTableView.register(UINib(nibName: "topTableViewCell", bundle: nil), forCellReuseIdentifier: "topTableViewCell") //nib 파일 등록
        bottomTableView.delegate = self
        bottomTableView.dataSource = self
        bottomTableView.alwaysBounceHorizontal = false
        bottomTableView.register(UINib(nibName: "bottomTableViewCell", bundle: nil), forCellReuseIdentifier: "bottomTableViewCell") //nib 파일 등록
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //cell의 갯수 설정
        if tableView == topTableView {
            return 4
        } else if tableView == bottomTableView {
            return 10// 8개 까지 가능
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //cell의
        if tableView == topTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "topTableViewCell", for: indexPath) as! topTableViewCell
            let url = URL(string: "https://prod.risingtestbaemin.shop/image/menus/002.jpg")
            let data = try? Data(contentsOf: url!)
            cell.foodImage.image = UIImage(data: data!)
            cell.selectionStyle = .none
            return cell
        } else if tableView == bottomTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "bottomTableViewCell", for: indexPath) as! bottomTableViewCell
            cell.selectionStyle = .none
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { //cell의 높이 설정
        if tableView == topTableView {
            return 130
        } else if tableView == bottomTableView {
            return 59.5
        } else {
            return 160
        }
    
    }

}
