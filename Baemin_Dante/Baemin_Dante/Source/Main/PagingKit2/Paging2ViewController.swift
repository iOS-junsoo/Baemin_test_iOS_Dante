//
//  Paging2ViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/06.
//

import UIKit
import PagingKit

class Paging2ViewController: UIViewController {

    private var viewControllers: Array<UIViewController> = []
    var menuViewController: PagingMenuViewController!
    var contentViewController: PagingContentViewController!
    var dataSource = ["한식", "분식", "돈까스·회·일식", "치킨", "피자", "아시안·양식", "중식"]
    
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
            self.navigationController?.popToRootViewController(animated: true)
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
        
//        switch Page.pageTitle1 {
//        case 0:
//            cell.myView.alpha = array1[index]
//            cell.myView.frame = CGRect(x: 31, y: 7, width: 60, height: 38)
//            cell.titleLabel.textColor = array11[index]
//            cell.titleLabel.font = array011[index]
//        case 1:
//            cell.myView.alpha = array2[index]
//            cell.myView.frame = CGRect(x: 31, y: 7, width: 60, height: 38)
//            cell.titleLabel.textColor = array22[index]
//            cell.titleLabel.font = array022[index]
//
//        case 2:
//            cell.myView.alpha = array3[index]
//            cell.myView.frame = CGRect(x: 31, y: 7, width: 60, height: 38)
//            cell.titleLabel.textColor = array33[index]
//            cell.titleLabel.font = array033[index]
//
//        case 3:
//            cell.myView.alpha = array4[index]
//            cell.myView.frame = CGRect(x: 8, y: 7, width: 105, height: 38)
//            cell.titleLabel.textColor = array44[index]
//            cell.titleLabel.font = array044[index]
//
//        case 4:
//            cell.myView.alpha = array5[index]
//            cell.myView.frame = CGRect(x: 18, y: 7, width: 85, height: 38)
//            cell.titleLabel.textColor = array55[index]
//            cell.titleLabel.font = array055[index]
//
//        case 5:
//            cell.myView.alpha = array6[index]
//            cell.myView.frame = CGRect(x: 18, y: 7, width: 85, height: 38)
//            cell.titleLabel.textColor = array66[index]
//            cell.titleLabel.font = array066[index]
//
//        default:
//            print("error")
//            
//        }
        

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
//        Page.pageTitle1 = page
//        menuViewController.reloadData()
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
