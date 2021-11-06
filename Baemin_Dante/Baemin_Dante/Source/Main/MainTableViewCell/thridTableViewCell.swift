//
//  thridTableViewCell.swift
//  Tableview-Baemin_Demo
//
//  Created by 준수김 on 2021/11/02.
//

import UIKit

class thridTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    func configure(with models2: [Model2]){
        self.models2 = models2
        collectionView.reloadData()
    }
    var nowPage: Int = 0 //자동배너 변수
    var models2 = [Model2]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCollectionView()
    }
    
    func setUpCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "secondCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "secondCollectionViewCell") //xib파일 등록
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//
        // Configure the view for the selected state
    }
    
    
}

extension thridTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models2.count //model의 수 만큼 cell개수 설정
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "secondCollectionViewCell", for: indexPath) as! secondCollectionViewCell
        cell.configure(with: models2[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize { //cell의 크기 설정
        return CGSize(width: 280, height: 160)
    }
    
}
