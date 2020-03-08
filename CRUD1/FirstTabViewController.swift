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

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var hedder: UIView!
    //    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var titleText: UILabel!
//    var cellVC:cellSettingViewController!
    @IBOutlet weak var tableView: UITableView!
    
    var cellCount = 0
    var value = 2
    let sum = 10
    var doneCheck:[Bool] = [
        false,
        false,
        false,
        false,
        false,
    ]
    //断念を押したかどうか
    var undoCheck:[Bool] = [
        false,
        false,
        false,
        false,
        false,
    ]
//    var tabSelectedIndex = 2
    let onColor = UIColor(red: 23/255, green: 58/255, blue: 130/255, alpha: 1.0)
    let offColor = UIColor.gray
    var testArray:[String] = [
        "お金を貯める",
        "掃除をする",
        "アプリ開発の勉強をする",
        "毎日腹筋をする",
        "メンタルを強くする",
    ]
    var contentArray:[String] = [
        "毎日500円分貯める",
        "毎朝軽くでもいいから掃除をする",
        "30分以上Swiftの勉強をする",
        "毎朝20回以上やる",
        "寝る前に自己啓発本を読む",
    ]
    var progressValue:[Int] = [
        10,
        10,
        10,
        10,
        10,
    ]
    var dayArray:[String] = [
        "2020/01/12",
        "2020/01/15",
        "2020/02/02",
        "2020/02/23",
        "2020/02/28",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        
        hedder.backgroundColor = .init(red: 23/255, green: 58/255, blue: 130/255, alpha: 0.8)

        addButton.setTitle("＋", for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 25)
        addButton.setTitleColor(.white, for: .normal)
        
        titleText.text = "進行中の目標"
        titleText.frame.size.width = view.frame.size.width * 0.8
        titleText.textAlignment = .center
        titleText.textColor = .white
        titleText.font = .boldSystemFont(ofSize: 20.0)
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
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        cell.testText = testArray[indexPath.row]
        cell.content = contentArray[indexPath.row]
        cell.progressText = "\(progressValue[indexPath.row])/\(sum)"
        cell.progressView.setProgress(Float(progressValue[indexPath.row]) / Float(sum), animated: true)
        cell.accessoryType = .disclosureIndicator
        
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
            case 0: cellCount = 0
                    UserDefaults.standard.set(false, forKey: "launchedBefore")
            case 1: cellCount = 1
            case 2: cellCount = 2
            case 3: cellCount = 3
            case 4: cellCount = 4
            default: break
        }
        
        performSegue(withIdentifier: "cellSetting", sender: nil)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        if contentArray.count == 5 {
            let alert = UIAlertController(title: "挑戦できる目標は5個までです", message: "", preferredStyle: .alert)
            present(alert, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                self.dismiss(animated: true, completion: nil)
            }
        } else {
            performSegue(withIdentifier: "register", sender: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cellSetting" {
            let cellVC = segue.destination as! cellSettingViewController
            cellVC.doneCheck[cellCount] = self.doneCheck[cellCount]
            cellVC.testText = testArray[cellCount]
            cellVC.content = contentArray[cellCount]
            cellVC.day = dayArray[cellCount]
            cellVC.cellCount = cellCount
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
