//
//  PagingViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/05.
//

import UIKit
import PagingKit

class PagingViewController: UIViewController {

    @IBOutlet var SearchBtn: UIButton!
    @IBOutlet var jjimBtn: UIButton!
    @IBOutlet var baeminBtn: UIButton!
    @IBOutlet var myView: UIView!
    @IBOutlet var jumunBtn: UIButton!
    @IBOutlet var myBaeminBtn: UIButton!
    private var viewControllers: Array<UIViewController> = []
    var menuViewController: PagingMenuViewController!
    var contentViewController: PagingContentViewController!
    var dataSource = ["배달", "배민1", "포장", "쇼핑라이브", "선물하기", "전국별미"]
    var array1 = [1.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    var array2 = [0.0, 1.0, 0.0, 0.0, 0.0, 0.0]
    var array3 = [0.0, 0.0, 1.0, 0.0, 0.0, 0.0]
    var array4 = [0.0, 0.0, 0.0, 1.0, 0.0, 0.0]
    var array5 = [0.0, 0.0, 0.0, 0.0, 1.0, 0.0]
    var array6 = [0.0, 0.0, 0.0, 0.0, 0.0, 1.0]
    
    var array11 : [UIColor] = [.white, .lightGray, .lightGray,  .lightGray, .lightGray, .lightGray]
    var array22 : [UIColor] = [.lightGray, .white, .lightGray,  .lightGray, .lightGray, .lightGray]
    var array33 : [UIColor] = [.lightGray, .lightGray, .white,  .lightGray, .lightGray, .lightGray]
    var array44 : [UIColor] = [.lightGray, .lightGray, .lightGray,  .white, .lightGray, .lightGray]
    var array55 : [UIColor] = [.lightGray, .lightGray, .lightGray,  .lightGray, .white, .lightGray]
    var array66 : [UIColor] = [.lightGray, .lightGray, .lightGray,  .lightGray, .lightGray, .white]
    
    var array011 : [UIFont] = [.systemFont(ofSize: 17, weight: .bold), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium)]
    var array022 : [UIFont] = [.systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .bold), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium)]
    var array033 : [UIFont] = [.systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .bold), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium)]
    var array044 : [UIFont] = [.systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .bold), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium)]
    var array055 : [UIFont] = [.systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .bold), .systemFont(ofSize: 17, weight: .medium)]
    var array066 : [UIFont] = [.systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .bold)]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //버튼 회색 이벤트 없애기
        SearchBtn.adjustsImageWhenHighlighted = false
        jjimBtn.adjustsImageWhenHighlighted = false
        baeminBtn.adjustsImageWhenHighlighted = false
        jumunBtn.adjustsImageWhenHighlighted = false
        myBaeminBtn.adjustsImageWhenHighlighted = false
        
        
        //하단 View 그림자.
        
        myView.layer.shadowColor = UIColor.black.cgColor // 색깔
        myView.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        myView.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        myView.layer.shadowRadius = 5 // 반경
        myView.layer.shadowOpacity = 0.3 // alpha값
        
        
        self.navigationItem.setHidesBackButton(true, animated: true) //백버튼 숨김
        
        let vc1 = UIStoryboard.init(name: "BaedalStoryboard", bundle: nil).instantiateViewController(withIdentifier: "BaedalViewController") as! BaedalViewController
        let vc2 = UIStoryboard.init(name: "Baemin1Storyboard", bundle: nil).instantiateViewController(withIdentifier: "Baemin1ViewController") as! Baemin1ViewController
        let vc3 = UIStoryboard.init(name: "PojangStoryboard", bundle: nil).instantiateViewController(withIdentifier: "PojangViewController") as! PojangViewController
        let vc4 = UIStoryboard.init(name: "LiveStoryboard", bundle: nil).instantiateViewController(withIdentifier: "LiveViewController") as! LiveViewController
        let vc5 = UIStoryboard.init(name: "GiftStoryboard", bundle: nil).instantiateViewController(withIdentifier: "GiftViewController") as! GiftViewController
        let vc6 = UIStoryboard.init(name: "JeongukStoryboard", bundle: nil).instantiateViewController(withIdentifier: "JeongukViewController") as! JeongukViewController
        
        viewControllers.append(vc1)
        viewControllers.append(vc2)
        viewControllers.append(vc3)
        viewControllers.append(vc4)
        viewControllers.append(vc5)
        viewControllers.append(vc6)
        menuViewController.register(nib: UINib(nibName: "MenuCell", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
        menuViewController.reloadData()
        contentViewController.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationController?.setNavigationBarHidden(true, animated: animated)
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            self.navigationController?.setNavigationBarHidden(false, animated: animated)
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
    
    @IBAction func SearchBtnTap(_ sender: UIButton) {
        let seStoryboard = UIStoryboard(name: "SearchStoryboard", bundle: nil) //스토리보드 결정
        let searchVC = seStoryboard.instantiateViewController(identifier: "SearchViewController")
        self.navigationController?.pushViewController(searchVC, animated: true)
        
    }
    
    
    
    @IBAction func BaeminTabbarBtn(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func myBaeminBtnTap(_ sender: UIButton) {
        let myStoryboard = UIStoryboard(name: "MyBeaminStoryboard", bundle: nil) //스토리보드 결정
        let myVC = myStoryboard.instantiateViewController(identifier: "MyBeaminViewController")
        self.navigationController?.pushViewController(myVC, animated: true)
    }
    

}
//MARK: - menu datasource
extension PagingViewController: PagingMenuViewControllerDataSource {
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        return dataSource.count
    }
    
    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
        switch index {
        case 0:
            return 70
        case 1:
            return 70
        case 2:
            return 85
        case 3:
            return 100
        case 4:
            return 100
        case 5:
            return 110
        default:
            return 100
        }
        
        
    }
    
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: index) as! MenuCell
        
        cell.titleLabel.text = dataSource[index]
        cell.myView.backgroundColor = hexStringToUIColor(hex: "#00BEC1")
        
        switch Page.pageTitle1 {
        case 0:
            cell.myView.alpha = array1[index]
            cell.myView.frame.size.width = 60
            cell.titleLabel.textColor = array11[index]
            cell.titleLabel.font = .systemFont(ofSize: 17, weight: .bold)
        case 1:
            cell.myView.alpha = array2[index]
            cell.myView.frame.size.width = 60
            cell.titleLabel.textColor = array22[index]
        case 2:
            cell.myView.alpha = array3[index]
            cell.myView.frame.size.width = 60
            cell.titleLabel.textColor = array33[index]
        case 3:
            cell.myView.alpha = array4[index]
            cell.myView.frame.size.width = 60
            cell.titleLabel.textColor = array44[index]
        case 4:
            cell.myView.alpha = array5[index]
            cell.myView.frame.size.width = 60
            cell.titleLabel.textColor = array55[index]
        case 5:
            cell.myView.alpha = array6[index]
            cell.myView.frame.size.width = 60
            cell.titleLabel.textColor = array66[index]
        default:
            print("error")
            
        }
        
//        switch Page.pageTitle2 {
//        case 0:
//            cell.myView.backgroundColor = array1[index]
//            cell.myView.frame.size.width = 60
//        case 1:
//            cell.myView.backgroundColor = array2[index]
//            cell.myView.frame.size.width = 60
//        case 2:
//            cell.myView.backgroundColor = array3[index]
//            cell.myView.frame.size.width = 60
//        case 3:
//            cell.myView.backgroundColor = array4[index]
//            cell.myView.frame.size.width = 60
//        case 4:
//            cell.myView.backgroundColor = array5[index]
//            cell.myView.frame.size.width = 60
//        case 5:
//            cell.myView.backgroundColor = array6[index]
//            cell.myView.frame.size.width = 60
//        default:
//            print("error")
//
//        }
        
        return cell
    }
}
//MARK: - contents datasource
extension PagingViewController: PagingContentViewControllerDataSource {
    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
        return dataSource.count
    }
    
    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
        return viewControllers[index]
    }
}


//MARK: - menu delegate
extension PagingViewController: PagingMenuViewControllerDelegate {
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
        contentViewController.scroll(to: page, animated: true)
        Page.pageTitle1 = page
        menuViewController.reloadData()
    }
}
//MARK: - contents delegate
extension PagingViewController: PagingContentViewControllerDelegate {
    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
        menuViewController.scroll(index: index, percent: percent, animated: false)
        Page.pageTitle2 = index
        print("인덱스\(index)")
    }
}

extension PagingViewController {
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

