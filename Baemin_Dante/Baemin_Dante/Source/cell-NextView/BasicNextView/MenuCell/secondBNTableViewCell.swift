//
//  secondBNTableViewCell.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/08.
//

import UIKit
import Tabman
import Pageboy

class secondBNTableViewCell: UITableViewCell {
    private var viewControllers: Array<UIViewController> = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let vc1 = UIStoryboard.init(name: "MenuStoryboard", bundle: nil).instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        let vc2 = UIStoryboard.init(name: "InformationStoryboard", bundle: nil).instantiateViewController(withIdentifier: "InformationViewController") as! InformationViewController
        let vc3 = UIStoryboard.init(name: "ReviewStoryboard", bundle: nil).instantiateViewController(withIdentifier: "ReviewViewController") as! InformationViewController
                    
        viewControllers.append(vc1)
        viewControllers.append(vc2)
        viewControllers.append(vc3)
        
//        self.dataSource = self
//
//        // Create bar
//        let bar = TMBar.ButtonBar()
//        bar.layout.transitionStyle = .snap // Customiz
//        // Add to view
//        addBar(bar, dataSource: self, at: .top)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension secondBNTableViewCell: PageboyViewControllerDataSource, TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let item = TMBarItem(title: "")
        item.title = "Page \(index)"
        item.image = UIImage(named: "image.png")
        // ↑↑ 이미지는 이따가 탭바 형식으로 보여줄 때 사용할 것이니 "이미지가 왜 있지?" 하지말고 넘어가주세요.
        
        return item
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}

