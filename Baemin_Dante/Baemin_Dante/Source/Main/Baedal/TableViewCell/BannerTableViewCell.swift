//
//  BannerTableViewCell.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/05.
//

import UIKit

class BannerTableViewCell: UITableViewCell {

    @IBOutlet var collectionView: UICollectionView!
    
    func configure(with models: [Model]){
        self.models = models
        collectionView.reloadData()
    }
    
    var models = [Model]()
    var nowPage: Int = 0 //자동배너 변수
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCollectionView()
        bannerTimer()
    }
    
    func setUpCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "BannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BannerCollectionViewCell") //xib파일 등록
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //자동배너 함수
    func bannerTimer() {
            let _: Timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (Timer) in
                self.bannerMove()
                //print("현재 페이지: \(self.nowPage)")
            }
        }
        // 배너 움직이는 매서드
        func bannerMove() {
            
            // 현재페이지가 마지막 페이지일 경우
            if nowPage == models.count-1 {
            // 맨 처음 페이지로 돌아감
                collectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
                nowPage = 0
                return
            }
            // 다음 페이지로 전환
            nowPage += 1
            collectionView.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
        }
    
}

extension BannerTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count //model의 수 만큼 cell개수 설정
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as! BannerCollectionViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize { //cell의 크기 설정
        return CGSize(width: 280, height: 160)
    }
    
//    컬렉션뷰 감속 끝났을 때 현재 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
}
