//
//  PojangViewController.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/04.
//

import UIKit

class PojangViewController: UIViewController {
    // 현재페이지 체크 변수 (자동 스크롤할 때 필요)
    var nowPage: Int = 0
    @IBOutlet var bannerCollectionView: UICollectionView!
    // 데이터 배열
    let dataArray: Array<UIImage> = [UIImage(named: "주문내역배너1")!, UIImage(named: "주문내역배너2")!, UIImage(named: "주문내역배너3")!]
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerTimer()
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
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

extension PojangViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
