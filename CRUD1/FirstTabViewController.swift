//
//  TabOneViewController.swift
//  CRUD1
//
//  Created by Tanaka Soushi on 2020/02/09.
//  Copyright © 2020 Tanaka Soushi. All rights reserved.
//

import UIKit
//import FontAwesomeKit

class FirstTabViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

//    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var titleText: UILabel!
    
    
//    var tabSelectedIndex = 2
    let onColor = UIColor(red: 23/255, green: 58/255, blue: 130/255, alpha: 1.0)
    let offColor = UIColor.gray
    var testArray = ["牛乳を買う", "掃除をする", "アプリ開発の勉強をする","a","a"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        titleText.text = "進行中の目標"
        titleText.frame.size.width = view.frame.size.width * 0.8
        titleText.textAlignment = .center
        
//        tabBarController?.selectedIndex = tabSelectedIndex
        
        setTabBarItem(index: 0, title: "現在の目標" ,image: UIImage(named: "tab01")!, selectedImage: UIImage(named: "tab01ed")!/*, offColor: offColor, onColor: onColor*/)
        setTabBarItem(index: 1, title: "目標リスト" ,image: UIImage(named: "tab02")!,selectedImage: UIImage(named: "tab02ed")!/*, offColor: offColor, onColor: onColor*/)
        setTabBarItem(index: 2, title: "マイページ" ,image: UIImage(named: "tab03")!, selectedImage: UIImage(named: "tab03ed")!/*, offColor: offColor, onColor: onColor*/)
        
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
    func setTabBarItem(index: Int, title: String ,image: UIImage, selectedImage: UIImage/*,  offColor: UIColor, onColor: UIColor*/) -> Void {
        if let tabBarItem = self.tabBarController?.tabBar.items![index] {
//          https://program-life.com/1073
            tabBarItem.title = title
            tabBarItem.image = image.withRenderingMode(.alwaysOriginal)
            tabBarItem.selectedImage = selectedImage.withRenderingMode(.alwaysOriginal)
//            tabBarItem.setTitleTextAttributes([ .foregroundColor : offColor], for: .normal)
//            tabBarItem.setTitleTextAttributes([ .foregroundColor : onColor], for: .selected)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = "TODO[indexPath.row]"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        switch indexPath.row {
            case 0:print("")
            case 1:print("")
            case 2:print("")
            case 3:print("")
            case 4:print("")
            default:print("")
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == UITableViewCell.EditingStyle.delete {
            testArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
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
