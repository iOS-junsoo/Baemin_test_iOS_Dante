//
//  BasicNextViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/07.
//

import UIKit
import PagingKit

class BasicNextViewController: UIViewController {
    private var viewControllers: Array<UIViewController> = []
    @IBOutlet var restaurantNameLabel: UILabel!
    @IBOutlet var myView: UIView!
    @IBOutlet var restaurantName: UILabel!
    @IBOutlet var restaurantStar: UILabel!
    @IBOutlet var restaurantReview: UILabel!
    @IBOutlet var restaurantBossCommnet: UILabel!
    @IBOutlet var restaurantJjim: UILabel!
    @IBOutlet var orderPay: UILabel!
    @IBOutlet var paymentMethod: UILabel!
    @IBOutlet var deliveryTime: UILabel!
    @IBOutlet var deliveryTip: UILabel!
    @IBOutlet var JjimBtn: UIButton!
    var JjimCount = 0
    var JjimCheck = 0
    
    var menuViewController: PagingMenuViewController!
    var contentViewController: PagingContentViewController!
    var dataSource = ["메뉴", "정보", "리뷰"]
    
    var array1 = [1.0, 0.0, 0.0]
    var array2 = [0.0, 1.0, 0.0]
    var array3 = [0.0, 0.0, 1.0]
    
    //하단바
    var choice1 = [0.0, 1.0, 1.0]
    var choice2 = [1.0, 0.0, 1.0]
    var choice3 = [1.0, 1.0, 0.0]
    
    //좌측바
    var left1 = [0.0, 0.0, 0.0]
    var left2 = [0.0, 1.0, 0.0]
    var left3 = [0.0, 0.0, 1.0]
    
    //우측바
    var right1 = [1.0, 0.0, 0.0]
    var right2 = [0.0, 1.0, 0.0]
    var right3 = [0.0, 0.0, 0.0]
    
    
    var array11 : [UIColor] = [.black, .lightGray, .lightGray]
    var array22 : [UIColor] = [.lightGray, .black, .lightGray]
    var array33 : [UIColor] = [.lightGray, .lightGray, .black]
    
    var array011 : [UIFont] = [.systemFont(ofSize: 17, weight: .bold), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium)]
    var array022 : [UIFont] = [.systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .bold), .systemFont(ofSize: 17, weight: .medium)]
    var array033 : [UIFont] = [.systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .bold)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CNRequest().getData()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            self.setUpCard()
            
        }
        
        myView.layer.shadowColor = UIColor.black.cgColor // 색깔
        myView.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        myView.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        myView.layer.shadowRadius = 5 // 반경
        myView.layer.shadowOpacity = 0.3 // alpha값
        
        //MARK: - VC 추가
        let vc1 = UIStoryboard.init(name: "MenuStoryboard", bundle: nil).instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        let vc2 = UIStoryboard.init(name: "InformationStoryboard", bundle: nil).instantiateViewController(withIdentifier: "InformationViewController") as! InformationViewController
        let vc3 = UIStoryboard.init(name: "ReviewStoryboard", bundle: nil).instantiateViewController(withIdentifier: "ReviewViewController") as! ReviewViewController
                    
        viewControllers.append(vc1)
        viewControllers.append(vc2)
        viewControllers.append(vc3)
        
        menuViewController.register(nib: UINib(nibName: "BasicMenuCell", bundle: nil), forCellWithReuseIdentifier: "BasicMenuCell")
        
        menuViewController.reloadData()
        contentViewController.reloadData()
        
        
        //MARK: - navigationbar back button hide
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        //MARK: - basket Button
        let button = UIButton(frame: CGRect(x: 285, y: 707, width: 105, height: 98))
        button.setImage(UIImage(named: "장바구니0"), for: .normal)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        
        //버튼 그림자
        button.layer.shadowColor = UIColor.black.cgColor // 색깔
        button.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        button.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        button.layer.shadowRadius = 5 // 반경
        button.layer.shadowOpacity = 0.3 // alpha값
        self.view.addSubview(button)
        
        
    }
    
    func setUpCard(){
        restaurantNameLabel.text = CNDataModel.restaurantName
        restaurantName.text = CNDataModel.restaurantName
        restaurantStar.text = "\(CNDataModel.restaurantStar)"
        restaurantReview.text = "\(CNDataModel.restaurantReview)"
        restaurantBossCommnet.text = "\(CNDataModel.restaurantBossComment)"
        restaurantJjim.text = "\(CNDataModel.restaurantJjim + JjimCount)"
        orderPay.text = "\(CNDataModel.restaurantOrderPay)원"
        paymentMethod.text = "바로 결제, 만나서 결제, 예약가능"
        deliveryTime.text = CNDataModel.restaurantDeliveryTime
        deliveryTip.text = "\(CNDataModel.restaurantDeliveryPay)원"
        
    }
    @IBAction func JjimBtnClick(_ sender: UIButton) {
        JjimCheck += 1
        if JjimCheck % 2 == 1 { //0에서 1로 바꿈
            JjimCount += 1
            restaurantJjim.text = "\(CNDataModel.restaurantJjim + JjimCount)"
            JjimBtn.tintColor = .red
        } else {
            if CNDataModel.restaurantJjim - JjimCount == 0 {
                restaurantJjim.text = "0"
                JjimBtn.tintColor = .black
            } else {
                JjimCount -= 1
                restaurantJjim.text = "\(CNDataModel.restaurantJjim - JjimCount)"
                JjimBtn.tintColor = .black
            }
            
        }
        
        
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
    
    @objc func handleTap(_ sender: UIButton) {
        let alStoryboard = UIStoryboard(name: "BaketStoryboard", bundle: nil) //스토리보드 결정
        let alarmVC = alStoryboard.instantiateViewController(identifier: "BaketViewController")
        self.navigationController?.pushViewController(alarmVC, animated: true)
        
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationController?.setNavigationBarHidden(true, animated: animated)
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            self.navigationController?.setNavigationBarHidden(false, animated: animated)
        }

    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}

extension BasicNextViewController: PagingMenuViewControllerDataSource {
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        return dataSource.count
    }
    
    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
        switch index {
        case 0:
            return 128
        case 1:
            return 128
        case 2:
            return 128

        default:
            return 100
        }
        
        
    }
    
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "BasicMenuCell", for: index) as! BasicMenuCell
        
        cell.titleLabel.text = dataSource[index]
//        cell.myView.backgroundColor = hexStringToUIColor(hex: "#00BEC1")
        switch BNModel.pageState {
        case 0:
            cell.myView.alpha = array1[index]
            cell.titleLabel.textColor = array11[index]
            cell.titleLabel.font = array011[index]
            cell.leftView.alpha = left1[index]
            cell.rightView.alpha = right1[index]
            cell.bottomView.alpha = choice1[index]
            
        case 1:
            cell.myView.alpha = array2[index]
            cell.titleLabel.textColor = array22[index]
            cell.titleLabel.font = array022[index]
            cell.leftView.alpha = left2[index]
            cell.rightView.alpha = right2[index]
            cell.bottomView.alpha = choice2[index]
            
        case 2:
            cell.myView.alpha = array3[index]
            cell.titleLabel.textColor = array33[index]
            cell.titleLabel.font = array033[index]
            cell.leftView.alpha = left3[index]
            cell.rightView.alpha = right3[index]
            cell.bottomView.alpha = choice3[index]
            
        default:
            print("error")
            
        }
        
        

        return cell
    }
}
//MARK: - contents datasource
extension BasicNextViewController: PagingContentViewControllerDataSource {
    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
        return dataSource.count
    }
    
    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
        return viewControllers[index]
    }
}


//MARK: - menu delegate
extension BasicNextViewController: PagingMenuViewControllerDelegate {
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
        contentViewController.scroll(to: page, animated: true)
        BNModel.pageState = page
        menuViewController.reloadData()
    }
}
//MARK: - contents delegate
extension BasicNextViewController: PagingContentViewControllerDelegate {
    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
        menuViewController.scroll(index: index, percent: percent, animated: false)

    }
}

extension BasicNextViewController {
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
