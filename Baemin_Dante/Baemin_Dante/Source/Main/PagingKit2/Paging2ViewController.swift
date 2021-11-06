//
//  Paging2ViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/06.
//

import UIKit
import PagingKit

class Paging2ViewController: UIViewController {

    @IBOutlet var textLabel: UILabel!
    private var viewControllers: Array<UIViewController> = []
    var menuViewController: PagingMenuViewController!
    var contentViewController: PagingContentViewController!
    var dataSource = ["한식", "분식", "돈까스·회·일식", "치킨", "피자", "아시안·양식", "중식"]
    
    var array1 = [1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    var array2 = [0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    var array3 = [0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0]
    var array4 = [0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0]
    var array5 = [0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0]
    var array6 = [0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0]
    var array7 = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0]
    
    var array11 : [UIColor] = [.black, .lightGray, .lightGray,  .lightGray, .lightGray, .lightGray, .lightGray]
    var array22 : [UIColor] = [.lightGray, .black, .lightGray,  .lightGray, .lightGray, .lightGray, .lightGray]
    var array33 : [UIColor] = [.lightGray, .lightGray, .black,  .lightGray, .lightGray, .lightGray, .lightGray]
    var array44 : [UIColor] = [.lightGray, .lightGray, .lightGray,  .black, .lightGray, .lightGray, .lightGray]
    var array55 : [UIColor] = [.lightGray, .lightGray, .lightGray,  .lightGray, .black, .lightGray, .lightGray]
    var array66 : [UIColor] = [.lightGray, .lightGray, .lightGray,  .lightGray, .lightGray, .black, .lightGray]
    var array77 : [UIColor] = [.lightGray, .lightGray, .lightGray,  .lightGray, .lightGray, .lightGray, .black]
    
    var array011 : [UIFont] = [.systemFont(ofSize: 17, weight: .bold), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium)]
    var array022 : [UIFont] = [.systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .bold), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium)]
    var array033 : [UIFont] = [.systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .bold), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium)]
    var array044 : [UIFont] = [.systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .bold), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium)]
    var array055 : [UIFont] = [.systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .bold), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium)]
    var array066 : [UIFont] = [.systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .bold), .systemFont(ofSize: 17, weight: .medium)]
    var array077 : [UIFont] = [.systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .bold)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
        self.navigationItem.setHidesBackButton(true, animated: true) //백버튼 숨김
        
        let vc1 = UIStoryboard.init(name: "KoreaFoodStoryboard", bundle: nil).instantiateViewController(withIdentifier: "KoreaFoodViewController") as! KoreaFoodViewController
        let vc2 = UIStoryboard.init(name: "BunsikStoryboard", bundle: nil).instantiateViewController(withIdentifier: "BunsikViewController") as! BunsikViewController
        let vc3 = UIStoryboard.init(name: "DonegasStoryboard", bundle: nil).instantiateViewController(withIdentifier: "DonegasViewController") as! DonegasViewController
        let vc4 = UIStoryboard.init(name: "ChickenStoryboard", bundle: nil).instantiateViewController(withIdentifier: "ChickenViewController") as! ChickenViewController
        let vc5 = UIStoryboard.init(name: "PizzaStoryboard", bundle: nil).instantiateViewController(withIdentifier: "PizzaViewController") as! PizzaViewController
        let vc6 = UIStoryboard.init(name: "AsianStoryboard", bundle: nil).instantiateViewController(withIdentifier: "AsianViewController") as! AsianViewController
        let vc7 = UIStoryboard.init(name: "ChinaStoryboard", bundle: nil).instantiateViewController(withIdentifier: "ChinaViewController") as! ChinaViewController
        
        
        viewControllers.append(vc1)
        viewControllers.append(vc2)
        viewControllers.append(vc3)
        viewControllers.append(vc4)
        viewControllers.append(vc5)
        viewControllers.append(vc6)
        viewControllers.append(vc7)
        
        menuViewController.register(nib: UINib(nibName: "Menu2Cell", bundle: nil), forCellWithReuseIdentifier: "Menu2Cell")
        
        menuViewController.reloadData()
        contentViewController.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated:animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated:animated)
    }
    @IBAction func backBtn(_ sender: UIButton) {
            self.navigationController?.popViewController(animated: true)
        }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let vc = segue.destination as? PagingMenuViewController {
                menuViewController = vc
                menuViewController.dataSource = self
                menuViewController.delegate = self
                
            } else if let vc = segue.destination as? PagingContentViewController {
                contentViewController = vc
                contentViewController.dataSource = self
                contentViewController.delegate = self
            }
        }
    
}

//MARK: - menu datasource
extension Paging2ViewController: PagingMenuViewControllerDataSource {
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        return dataSource.count
    }
    
    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
        switch index {
        case 0:
            return 60
        case 1:
            return 100
        case 2:
            return 100
        case 3:
            return 60
        case 4:
            return 80
        case 5:
            return 80
        case 6:
            return 100

        default:
            return 100
        }
        
        
    }
    
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "Menu2Cell", for: index) as! Menu2Cell
        
        cell.titleLabel.text = dataSource[index]
//        cell.myView.backgroundColor = hexStringToUIColor(hex: "#00BEC1")
        
        switch Page2.pageTitle1 {
        case 0:
            cell.myView.alpha = array1[index]
            cell.myView.frame = CGRect(x: 43, y: 40, width: 36, height: 5)
            cell.titleLabel.textColor = array11[index]
            cell.titleLabel.font = array011[index]
            
        case 1:
            cell.myView.alpha = array2[index]
            cell.myView.frame = CGRect(x: 43, y: 40, width: 36, height: 5)
            cell.titleLabel.textColor = array22[index]
            cell.titleLabel.font = array022[index]
            
        case 2:
            cell.myView.alpha = array3[index]
            cell.myView.frame = CGRect(x: 10, y: 40, width: 100, height: 5)
            cell.titleLabel.textColor = array33[index]
            cell.titleLabel.font = array033[index]
            
        case 3:
            cell.myView.alpha = array4[index]
            cell.myView.frame = CGRect(x: 43, y: 40, width: 36, height: 5)
            cell.titleLabel.textColor = array44[index]
            cell.titleLabel.font = array044[index]
            
        case 4:
            cell.myView.alpha = array5[index]
            cell.myView.frame = CGRect(x: 43, y: 40, width: 36, height: 5)
            cell.titleLabel.textColor = array55[index]
            cell.titleLabel.font = array055[index]
            
        case 5:
            cell.myView.alpha = array6[index]
            cell.myView.frame = CGRect(x: 18, y: 40, width: 85, height: 5)
            cell.titleLabel.textColor = array66[index]
            cell.titleLabel.font = array066[index]
            
        case 6:
            cell.myView.alpha = array7[index]
            cell.myView.frame = CGRect(x: 43, y: 40, width: 36, height: 5)
            cell.titleLabel.textColor = array77[index]
            
        default:
            print("error")
            
        }
        

        return cell
    }
}
//MARK: - contents datasource
extension Paging2ViewController: PagingContentViewControllerDataSource {
    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
        return dataSource.count
    }
    
    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
        return viewControllers[index]
    }
}


//MARK: - menu delegate
extension Paging2ViewController: PagingMenuViewControllerDelegate {
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
        contentViewController.scroll(to: page, animated: true)
        Page2.pageTitle1 = page
        menuViewController.reloadData()
        textLabel.text = dataSource[Page2.pageTitle1]
    }
}
//MARK: - contents delegate
extension Paging2ViewController: PagingContentViewControllerDelegate {
    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
        menuViewController.scroll(index: index, percent: percent, animated: false)

    }
}

extension Paging2ViewController {
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
