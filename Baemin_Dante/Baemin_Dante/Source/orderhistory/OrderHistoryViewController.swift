//
//  OrderHistoryViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/09.
//

import UIKit
import PagingKit

class OrderHistoryViewController: UIViewController {

    @IBOutlet var bannerCollectionView: UICollectionView!
    
    // 현재페이지 체크 변수 (자동 스크롤할 때 필요)
    var nowPage: Int = 0

    // 데이터 배열
    let dataArray: Array<UIImage> = [UIImage(named: "주문내역배너1")!, UIImage(named: "주문내역배너2")!, UIImage(named: "주문내역배너3")!]
    
    private var viewControllers: Array<UIViewController> = []
    var menuViewController: PagingMenuViewController!
    var contentViewController: PagingContentViewController!
    var dataSource = ["배달/포장", "B마트", "쇼핑라이브", "전국별미"]
    
    var array1 = [1.0, 0.0, 0.0, 0.0]
    var array2 = [0.0, 1.0, 0.0, 0.0]
    var array3 = [0.0, 0.0, 1.0, 0.0]
    var array4 = [0.0, 0.0, 0.0, 1.0]
    
    var array11 : [UIColor] = [.black, .lightGray, .lightGray,  .lightGray]
    var array22 : [UIColor] = [.lightGray, .black, .lightGray,  .lightGray]
    var array33 : [UIColor] = [.lightGray, .lightGray, .black,  .lightGray]
    var array44 : [UIColor] = [.lightGray, .lightGray, .lightGray,  .black]
    
    var array011 : [UIFont] = [.systemFont(ofSize: 17, weight: .bold), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium)]
    var array022 : [UIFont] = [.systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .bold), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium)]
    var array033 : [UIFont] = [.systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .bold), .systemFont(ofSize: 17, weight: .medium)]
    var array044 : [UIFont] = [.systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .medium), .systemFont(ofSize: 17, weight: .bold)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerTimer()
        self.navigationItem.setHidesBackButton(true, animated: true) //백버튼 숨김
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        
        
        let vc4 = UIStoryboard.init(name: "NDStoryboard", bundle: nil).instantiateViewController(withIdentifier: "NDViewController") as! NDViewController
        let vc3 = UIStoryboard.init(name: "SLStoryboard", bundle: nil).instantiateViewController(withIdentifier: "SLViewController") as! SLViewController
        let vc2 = UIStoryboard.init(name: "BMStoryboard", bundle: nil).instantiateViewController(withIdentifier: "BMViewController") as! BMViewController
        let vc1 = UIStoryboard.init(name: "BPStoryboard", bundle: nil).instantiateViewController(withIdentifier: "BPViewController") as! BPViewController
        
        viewControllers.append(vc1)
        viewControllers.append(vc2)
        viewControllers.append(vc3)
        viewControllers.append(vc4)
        
        menuViewController.register(nib: UINib(nibName: "OrderHistoryMenuCell", bundle: nil), forCellWithReuseIdentifier: "OrderHistoryMenuCell")
        
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

    @IBAction func backBtn(_ sender: UIButton) {
            self.navigationController?.popViewController(animated: true)
        }
    
    // 2초마다 실행되는 타이머
       func bannerTimer() {
           let _: Timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (Timer) in
               self.bannerMove()
               print(self.nowPage)
           }
       }
       // 배너 움직이는 매서드
       func bannerMove() {
           // 현재페이지가 마지막 페이지일 경우
           if nowPage == dataArray.count-1 {
           // 맨 처음 페이지로 돌아감
               bannerCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
               nowPage = 0
               return
           }
           // 다음 페이지로 전환
           nowPage += 1
           bannerCollectionView.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
       }

}
extension OrderHistoryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //컬렉션뷰 개수 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    //컬렉션뷰 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
        cell.imgView.image = dataArray[indexPath.row]
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout 상속
    //컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bannerCollectionView.frame.size.width  , height:  bannerCollectionView.frame.height)
    }
    
    //컬렉션뷰 감속 끝났을 때 현재 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}

//MARK: - menu datasource
extension OrderHistoryViewController: PagingMenuViewControllerDataSource {
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        return dataSource.count
    }
    
    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
        switch index {
        case 0:
            return 80
        case 1:
            return 90
        case 2:
            return 100
        case 3:
            return 80

        default:
            return 100
        }
        
        
    }
    
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "OrderHistoryMenuCell", for: index) as! OrderHistoryMenuCell
        
        cell.titleLabel.text = dataSource[index]
//        cell.myView.backgroundColor = hexStringToUIColor(hex: "#00BEC1")
        
        switch OHModel.check {
        case 0:
            cell.myView.alpha = array1[index]
            cell.myView.frame = CGRect(x: 13, y: 39, width: 72, height: 5)
            cell.titleLabel.textColor = array11[index]
            cell.titleLabel.font = array011[index]
            
        case 1:
            cell.myView.alpha = array2[index]
            cell.myView.frame = CGRect(x: 25, y: 39, width: 48, height: 5)
            cell.titleLabel.textColor = array22[index]
            cell.titleLabel.font = array022[index]
            
        case 2:
            cell.myView.alpha = array3[index]
            cell.myView.frame = CGRect(x: 12, y: 39, width: 75, height: 5)
            cell.titleLabel.textColor = array33[index]
            cell.titleLabel.font = array033[index]
            
        case 3:
            cell.myView.alpha = array4[index]
            cell.myView.frame = CGRect(x: 22, y: 39, width: 58, height: 5)
            cell.titleLabel.textColor = array44[index]
            cell.titleLabel.font = array044[index]
            
    
            
        default:
            print("error")
            
        }
        

        return cell
    }
}
//MARK: - contents datasource
extension OrderHistoryViewController: PagingContentViewControllerDataSource {
    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
        return dataSource.count
    }
    
    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
        return viewControllers[index]
    }
}


//MARK: - menu delegate
extension OrderHistoryViewController: PagingMenuViewControllerDelegate {
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
        contentViewController.scroll(to: page, animated: true)
        OHModel.check = page
        menuViewController.reloadData()
        
    }
}
//MARK: - contents delegate
extension OrderHistoryViewController: PagingContentViewControllerDelegate {
    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
        menuViewController.scroll(index: index, percent: percent, animated: false)

    }
}
