//
//  TabOneViewController.swift
//  CRUD1
//
//  Created by Tanaka Soushi on 2020/02/09.
//  Copyright © 2020 Tanaka Soushi. All rights reserved.
//

import UIKit
//import FontAwesomeKit

class FirstTabViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    var tabSelectedIndex = 1
    let onColor = UIColor(red: 23/255, green: 58/255, blue: 130/255, alpha: 1.0)
    let offColor = UIColor.gray
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        tabBarController?.selectedIndex = tabSelectedIndex
        
        setTabBarItem(index: 0, titile: "現在の目標" ,image: UIImage(named: "tab01")!, selectedImage: UIImage(named: "tab01ed")!/*, offColor: offColor, onColor: onColor*/)
        setTabBarItem(index: 1, titile: "目標リスト" ,image: UIImage(named: "tab02")!,selectedImage: UIImage(named: "tab02ed")!/*, offColor: offColor, onColor: onColor*/)
        setTabBarItem(index: 2, titile: "マイページ" ,image: UIImage(named: "tab03")!, selectedImage: UIImage(named: "tab03ed")!/*, offColor: offColor, onColor: onColor*/)
        
        if let tabBar = tabBarController?.tabBar {
            
//            https://qiita.com/usada-kumi/items/298fb31c159a4cc75fcf
//            tabBarの上の線を消す
//            tabBar.backgroundImage = UIImage()
//            tabBarの色を変える
            tabBar.barTintColor = .white
//            TabBarItemの選択時の色を変える
            tabBar.tintColor = .init(red: 23/255, green: 58/255, blue: 130/255, alpha: 1.0)
//            TabBarItemの非選択時の色を変える
            tabBar.unselectedItemTintColor = .gray
//            一つ目のタブにバッヂを表示
            tabBar.items!.first?.badgeValue = "1"
//            バッジの色を変える
//            tabBar.items!.first?.badgeColor = UIColor.purple
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    func setTabBarItem(index: Int, titile: String ,image: UIImage, selectedImage: UIImage/*,  offColor: UIColor, onColor: UIColor*/) -> Void {
        if let tabBarItem = self.tabBarController?.tabBar.items![index] {
//          https://program-life.com/1073
            tabBarItem.title = titile
            tabBarItem.image = image.withRenderingMode(.alwaysOriginal)
            tabBarItem.selectedImage = selectedImage.withRenderingMode(.alwaysOriginal)
//            tabBarItem.setTitleTextAttributes([ .foregroundColor : offColor], for: .normal)
//            tabBarItem.setTitleTextAttributes([ .foregroundColor : onColor], for: .selected)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
