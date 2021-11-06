//
//  KoreaFoodViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/06.
//

import UIKit
import PagingKit

class KoreaFoodViewController: UIViewController {
    
    
    private var viewControllers: Array<UIViewController> = []
    var menuViewController: PagingMenuViewController!
    var contentViewController: PagingContentViewController!
    var dataSource = ["배달 빠른 순", "배달팁 낮은 순", "기본순", "주문 많은 순", "별점 높은 순", "가까운 순", "찜 많은순"]
    //텍스트 색
    var array11 = ["#A17654", "#9F9F9F", "#9F9F9F", "#9F9F9F", "#9F9F9F", "#9F9F9F", "#9F9F9F"]
    var array22 = ["#9F9F9F", "#A17654", "#9F9F9F", "#9F9F9F", "#9F9F9F", "#9F9F9F", "#9F9F9F"]
    var array33 = ["#9F9F9F", "#9F9F9F", "#A17654", "#9F9F9F", "#9F9F9F", "#9F9F9F", "#9F9F9F"]
    var array44 = ["#9F9F9F", "#9F9F9F", "#9F9F9F", "#A17654", "#9F9F9F", "#9F9F9F", "#9F9F9F"]
    var array55 = ["#9F9F9F", "#9F9F9F", "#9F9F9F", "#9F9F9F", "#A17654", "#9F9F9F", "#9F9F9F"]
    var array66 = ["#9F9F9F", "#9F9F9F", "#9F9F9F", "#9F9F9F", "#9F9F9F", "#A17654", "#9F9F9F"]
    var array77 = ["#9F9F9F", "#9F9F9F", "#9F9F9F", "#9F9F9F", "#9F9F9F", "#9F9F9F", "#A17654"]
    
    var array1 = [1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    var array2 = [0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    var array3 = [0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0]
    var array4 = [0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0]
    var array5 = [0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0]
    var array6 = [0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0]
    var array7 = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0]
    
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
        
        let vc1 = UIStoryboard.init(name: "FastStoryboard", bundle: nil).instantiateViewController(withIdentifier: "FastViewController") as! FastViewController
        let vc2 = UIStoryboard.init(name: "TipStoryboard", bundle: nil).instantiateViewController(withIdentifier: "TipViewController") as! TipViewController
        let vc3 = UIStoryboard.init(name: "BasicStoryboard", bundle: nil).instantiateViewController(withIdentifier: "BasicViewController") as! BasicViewController
        let vc4 = UIStoryboard.init(name: "OrderStoryboard", bundle: nil).instantiateViewController(withIdentifier: "OrderViewController") as! OrderViewController
        let vc5 = UIStoryboard.init(name: "StarStoryboard", bundle: nil).instantiateViewController(withIdentifier: "StarViewController") as! StarViewController
        let vc6 = UIStoryboard.init(name: "ShortStoryboard", bundle: nil).instantiateViewController(withIdentifier: "ShortViewController") as! ShortViewController
        let vc7 = UIStoryboard.init(name: "JjimStoryboard", bundle: nil).instantiateViewController(withIdentifier: "JjimViewController") as! JjimViewController
        
        viewControllers.append(vc1)
        viewControllers.append(vc2)
        viewControllers.append(vc3)
        viewControllers.append(vc4)
        viewControllers.append(vc5)
        viewControllers.append(vc6)
        viewControllers.append(vc7)
        
        menuViewController.register(nib: UINib(nibName: "Menu3Cell", bundle: nil), forCellWithReuseIdentifier: "Menu3Cell")
        
        menuViewController.reloadData()
        contentViewController.reloadData()
        
        //MARK: - navigationbar back button hide
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationController?.setNavigationBarHidden(true, animated: animated)
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            self.navigationController?.setNavigationBarHidden(false, animated: animated)
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
extension KoreaFoodViewController: PagingMenuViewControllerDataSource {
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        return dataSource.count
    }
    
    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
        switch index {
        case 0:
            return 120
        case 1:
            return 100
        case 2:
            return 90
        case 3:
            return 110
        case 4:
            return 100
        case 5:
            return 90
        case 6:
            return 120

        default:
            return 100
        }
        
        
    }
    
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "Menu3Cell", for: index) as! Menu3Cell
        
        cell.titleLabel.text = dataSource[index]
//        cell.myView.backgroundColor = hexStringToUIColor(hex: "#00BEC1")
        
        switch Page3.pageTitle1 {
        case 0:
            cell.myView.alpha = array1[index]
            cell.myView.frame = CGRect(x: 13, y: 11, width: 97, height: 32)
            cell.titleLabel.textColor = hexStringToUIColor(hex: array11[index])
            cell.titleLabel.font = array011[index]
            
        case 1:
            cell.myView.alpha = array2[index]
            cell.myView.frame = CGRect(x: 4, y: 10, width: 114, height: 32)
            cell.titleLabel.textColor = hexStringToUIColor(hex: array22[index])
            cell.titleLabel.font = array022[index]
            
        case 2:
            cell.myView.alpha = array3[index]
            cell.myView.frame = CGRect(x: 31, y: 11, width: 60, height: 32)
            cell.titleLabel.textColor = hexStringToUIColor(hex: array33[index])
            cell.titleLabel.font = array033[index]
            
        case 3:
            cell.myView.alpha = array4[index]
            cell.myView.frame = CGRect(x: 13, y: 11, width: 97, height: 32)
            cell.titleLabel.textColor = hexStringToUIColor(hex: array44[index])
            cell.titleLabel.font = array044[index]
            
        case 4:
            cell.myView.alpha = array5[index]
            cell.myView.frame = CGRect(x: 13, y: 11, width: 97, height: 32)
            cell.titleLabel.textColor = hexStringToUIColor(hex: array55[index])
            cell.titleLabel.font = array055[index]
            
        case 5:
            cell.myView.alpha = array6[index]
            cell.myView.frame = CGRect(x: 22, y: 11, width: 79, height: 32)
            cell.titleLabel.textColor = hexStringToUIColor(hex: array66[index])
            cell.titleLabel.font = array066[index]
            
        case 6:
            cell.myView.alpha = array7[index]
            cell.myView.frame = CGRect(x: 22, y: 11, width: 79, height: 32)
            cell.titleLabel.textColor = hexStringToUIColor(hex: array77[index])
            cell.titleLabel.font = array077[index]
        default:
            print("error")
            
        }
        

        return cell
    }
}
//MARK: - contents datasource
extension KoreaFoodViewController: PagingContentViewControllerDataSource {
    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
        return dataSource.count
    }
    
    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
        return viewControllers[index]
    }
}


//MARK: - menu delegate
extension KoreaFoodViewController: PagingMenuViewControllerDelegate {
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
        contentViewController.scroll(to: page, animated: true)
        Page3.pageTitle1 = page
        menuViewController.reloadData()
        
    }
}
//MARK: - contents delegate
extension KoreaFoodViewController: PagingContentViewControllerDelegate {
    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
        menuViewController.scroll(index: index, percent: percent, animated: false)

    }
}

extension KoreaFoodViewController {
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
