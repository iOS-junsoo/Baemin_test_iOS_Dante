//
//  MenuViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/08.
//

import UIKit

class Section {
    let title: String
    let menu: [String]
    let price: [String]
    var isOpend: Bool = true
    
    init(title: String,
         menu: [String],
         price: [String],
         isOpend: Bool = true) {
        self.title = title
        self.menu = menu
        self.price = price
        self.isOpend = isOpend
    }
}

class MenuViewController: UIViewController {

    @IBOutlet var topTableView: UITableView!
    @IBOutlet var bottomTableView: UITableView!
    
    private var sections = [Section]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sections = [Section(title: "사이드메뉴", menu: ["계란찜", "김말이튀김"], price: ["3500원", "3000원"]),
                    Section(title: "음료", menu: ["사이다", "콜라"], price: ["1500원", "1000원"])]

        topTableView.delegate = self
        topTableView.dataSource = self
        topTableView.alwaysBounceHorizontal = false
        topTableView.backgroundColor = UIColor.clear
        
        topTableView.register(UINib(nibName: "topTableViewCell", bundle: nil), forCellReuseIdentifier: "topTableViewCell") //nib 파일 등록
        bottomTableView.delegate = self
        bottomTableView.dataSource = self
        bottomTableView.alwaysBounceHorizontal = false
        bottomTableView.register(UINib(nibName: "bottomTableViewCell", bundle: nil), forCellReuseIdentifier: "bottomTableViewCell") //nib 파일 등록
        bottomTableView.register(UINib(nibName: "SectionTableViewCell", bundle: nil), forCellReuseIdentifier: "SectionTableViewCell") //nib 파일 등록
    
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if tableView == topTableView {
            return 1
        } else if tableView == bottomTableView {
            return sections.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //cell의 갯수 설정
        let section = sections[section]
        
        if tableView == topTableView {
            return 4
        } else if tableView == bottomTableView {
            if section.isOpend {
                return section.menu.count + 1
            } else {
                return 1
            }
            
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
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SectionTableViewCell", for: indexPath) as! SectionTableViewCell
                cell.sideMenu.text = sections[indexPath.section].title
                cell.selectionStyle = .none
                return cell
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "bottomTableViewCell", for: indexPath) as! bottomTableViewCell
                cell.foodName.text = sections[indexPath.section].menu[indexPath.row - 1]
                cell.foodPrice.text = sections[indexPath.section].price[indexPath.row - 1]
                cell.selectionStyle = .none
                return cell
            } else if indexPath.row == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "bottomTableViewCell", for: indexPath) as! bottomTableViewCell
                cell.foodName.text = sections[indexPath.section].menu[indexPath.row - 1]
                cell.foodPrice.text = sections[indexPath.section].price[indexPath.row - 1]
                cell.selectionStyle = .none
                return cell
            } else {
                return UITableViewCell()
            }
            
        } else {
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { //cell의 높이 설정
        if tableView == topTableView {
            return 130
        } else if tableView == bottomTableView {
            if indexPath.row == 0 {
                return 54
            } else if indexPath.row == 1 {
                return 77
            } else if indexPath.row == 2 {
                return 77
            } else {
                return 0
            }
            
        } else {
            return 160
        }
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == bottomTableView {
            sections[indexPath.section].isOpend = !sections[indexPath.section].isOpend
            bottomTableView.reloadSections([indexPath.section], with: .none)
        }
    }

}
