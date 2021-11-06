//
//  TodayTableViewCell.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/05.
//

import UIKit

class TodayTableViewCell: UITableViewCell {

    @IBOutlet var collectionView: UICollectionView!
    func configure(with models2: [Model2]){
        self.models2 = models2
        collectionView.reloadData()
    }
    var models2 = [Model2]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCollectionView()
    }
    
    func setUpCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "TodayCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TodayCollectionViewCell") //xib파일 등록
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension TodayTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models2.count //model의 수 만큼 cell개수 설정
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodayCollectionViewCell", for: indexPath) as! TodayCollectionViewCell
        cell.configure(with: models2[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize { //cell의 크기 설정
        return CGSize(width: 280, height: 160)
    }
    
}
