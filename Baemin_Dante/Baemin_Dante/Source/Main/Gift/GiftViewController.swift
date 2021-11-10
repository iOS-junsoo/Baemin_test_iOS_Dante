//
//  GiftViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/04.
//

import UIKit

class GiftViewController: UIViewController {
    var nowPage: Int = 0
    @IBOutlet var bannerCollectionView: UICollectionView!
    // 데이터 배열
    @IBOutlet var MyBtn1: UIButton!
    @IBOutlet var MyBtn2: UIButton!
    @IBOutlet var MyBtn3: UIButton!
    @IBOutlet var MyBtn4: UIButton!
    @IBOutlet var MyBtn5: UIButton!
    @IBOutlet var MyBtn6: UIButton!
    let dataArray: Array<UIImage> = [UIImage(named: "주문내역배너1")!, UIImage(named: "주문내역배너2")!, UIImage(named: "주문내역배너3")!]
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerTimer()
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        
        //MARK: - 버튼 그림자
        MyBtn1.layer.shadowColor = UIColor.black.cgColor // 색깔
        MyBtn1.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        MyBtn1.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        MyBtn1.layer.shadowRadius = 5 // 반경
        MyBtn1.layer.shadowOpacity = 0.3 // alpha값
        
        MyBtn2.layer.shadowColor = UIColor.black.cgColor // 색깔
        MyBtn2.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        MyBtn2.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        MyBtn2.layer.shadowRadius = 5 // 반경
        MyBtn2.layer.shadowOpacity = 0.3 // alpha값
        
        MyBtn3.layer.shadowColor = UIColor.black.cgColor // 색깔
        MyBtn3.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그3자는 밖에 그려지는 것이므로 false 로 설정
        MyBtn3.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        MyBtn3.layer.shadowRadius = 5 // 반경
        MyBtn3.layer.shadowOpacity = 0.3 // alpha값
        
        MyBtn4.layer.shadowColor = UIColor.black.cgColor // 색깔
        MyBtn4.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        MyBtn4.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        MyBtn4.layer.shadowRadius = 5 // 반경
        MyBtn4.layer.shadowOpacity = 0.3 // alpha값
        
        MyBtn5.layer.shadowColor = UIColor.black.cgColor // 색깔
        MyBtn5.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        MyBtn5.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        MyBtn5.layer.shadowRadius = 5 // 반경
        MyBtn5.layer.shadowOpacity = 0.3 // alpha값
        
        MyBtn6.layer.shadowColor = UIColor.black.cgColor // 색깔
        MyBtn6.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        MyBtn6.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        MyBtn6.layer.shadowRadius = 5 // 반경
        MyBtn6.layer.shadowOpacity = 0.3 // alpha값
        
        //MARK: - navigationbar back button hide
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
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

extension GiftViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
