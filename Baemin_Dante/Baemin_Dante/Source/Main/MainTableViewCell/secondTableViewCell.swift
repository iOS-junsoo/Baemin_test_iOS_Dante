//
//  secondTableViewCell.swift
//  Tableview-Baemin_Demo
//
//  Created by 준수김 on 2021/11/02.
//

import UIKit
import Gifu

protocol Custom1Delegate: class {
    func beadal()
    func baemin1()
    func pojang()
    func live()
    func gift()
    func jeonguk()
    func P()
    func C()
    func S()
    func J()
}


class secondTableViewCell: UITableViewCell {
    
    weak var delegate: Custom1Delegate?
    
    @IBOutlet var gifImageView: GIFImageView!
    @IBOutlet var baedalBtn: UIButton!
    @IBOutlet var pojangBtn: UIButton!
    @IBOutlet var liveBtn: UIButton!
    @IBOutlet var giftBtn: UIButton!
    @IBOutlet var jeongukBtn: UIButton!
    @IBOutlet var pointBtn: UIButton!
    @IBOutlet var couponBtn: UIButton!
    @IBOutlet var gifthamBtn: UIButton!
    @IBOutlet var heartBtn: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func configure(with models: [Model]){
        self.models = models
        collectionView.reloadData()
    }
    var nowPage: Int = 0 //자동배너 변수
    
    var models = [Model]()
    override func awakeFromNib() {
        super.awakeFromNib()
        bannerTimer()
        gifImageView.animate(withGIFNamed: "배민1") {
            print("GIF 실행중")
        }
        setUpCollectionView()
        baedalBtn.adjustsImageWhenHighlighted = false
        pojangBtn.adjustsImageWhenHighlighted = false
        liveBtn.adjustsImageWhenHighlighted = false
        giftBtn.adjustsImageWhenHighlighted = false
        jeongukBtn.adjustsImageWhenHighlighted = false
        pointBtn.adjustsImageWhenHighlighted = false
        couponBtn.adjustsImageWhenHighlighted = false
        gifthamBtn.adjustsImageWhenHighlighted = false
        heartBtn.adjustsImageWhenHighlighted = false
    }
    
    func setUpCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "firstCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "firstCollectionViewCell") //xib파일 등록
        
    }
    @IBAction func baedalTap(_ sender: UIButton) {
        beadal()
    }
    
    @IBAction func baemin1Tap(_ sender: UIButton) {
        beadal()
    }
    
    @IBAction func pojangTap(_ sender: UIButton) {
        beadal()
    }
    
    @IBAction func liveTap(_ sender: UIButton) {
        beadal()
    }
    
    @IBAction func giftTap(_ sender: UIButton) {
        beadal()
    }
    
    @IBAction func jeongukTap(_ sender: UIButton) {
        beadal()
    }
    @IBAction func point(_ sender: Any) {
        P()
    }
    
    @IBAction func coupon(_ sender: Any) {
        C()
    }
    
    @IBAction func gift(_ sender: Any) {
        S()
    }
    @IBAction func JJIM(_ sender: Any) {
        J()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
         //자동배너 함수
        // Configure the view for the selected state
    }
    
    //자동배너 함수
    func bannerTimer() {
            let _: Timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (Timer) in
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
extension secondTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count //model의 수 만큼 cell개수 설정
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "firstCollectionViewCell", for: indexPath) as! firstCollectionViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize { //cell의 크기 설정
        return CGSize(width: 280, height: 160)
    }
    
    //컬렉션뷰 감속 끝났을 때 현재 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
}

extension secondTableViewCell: Custom1Delegate {
    func beadal() {
        delegate?.beadal()
    }
    
    func baemin1() {
        delegate?.baemin1()
    }
    
    func pojang() {
        delegate?.pojang()
    }
    
    func live() {
        delegate?.live()
    }
    
    func gift() {
        delegate?.gift()
    }
    
    func jeonguk() {
        delegate?.jeonguk()
    }
    
    func P() {
        delegate?.P()
    }
    
    func C() {
        delegate?.C()
    }
    
    func S() {
        delegate?.S()
    }
    
    func J() {
        delegate?.J()
    }
    
    
    
}
