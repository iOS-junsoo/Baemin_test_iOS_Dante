//
//  fourthTableViewCell.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/02.
// 우리동네 빠른 배달

import UIKit

class fourthTableViewCell: UITableViewCell {

    @IBOutlet var collectionView: UICollectionView!
    
    func configure(with models3: [Model3]){
        self.models3 = models3
        collectionView.reloadData()
    }
    
    var models3 = [Model3]()
    
    
    func setUpCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "fourthCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "fourthCollectionViewCell") //xib파일 등록
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension fourthTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models3.count //model의 수 만큼 cell개수 설정
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fourthCollectionViewCell", for: indexPath) as! fourthCollectionViewCell
        cell.configure(with: models3[indexPath.row])
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize { //cell의 크기 설정
//        return CGSize(width: 280, height: 160)
//    }
    
}
