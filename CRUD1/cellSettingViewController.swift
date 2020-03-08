//
//  cellSettingViewController.swift
//  CRUD1
//
//  Created by Tanaka Soushi on 2020/02/25.
//  Copyright © 2020 Tanaka Soushi. All rights reserved.
//

import UIKit

class cellSettingViewController: UIViewController {

        
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var hedderLabel: UILabel!
    @IBOutlet weak var hedder: UIView!
    @IBOutlet weak var titleText: UILabel!
    var testText = ""
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var undoButton: UIButton!
    @IBOutlet weak var contentText: UILabel!
    var content = ""
    @IBOutlet weak var dayCount: UILabel!
    var day = ""
    
    
    //達成を押したかどうかを判断する
    var doneCheck = [
        false,
        false,
        false,
        false,
        false,
    ]

    var cellCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewSize = view.frame.size
        // Do any additional setup after loading the view.
        hedder.backgroundColor = .init(red: 23/255, green: 58/255, blue: 130/255, alpha: 0.8)
        hedderLabel.text = "目標"
        hedderLabel.frame.size.width = view.frame.size.width * 0.8
        hedderLabel.textColor = .white
        hedderLabel.font = .boldSystemFont(ofSize: 20.0)
        
        titleText.text = testText
        titleText.frame.size.width = viewSize.width * 0.8
        titleText.textAlignment = .center
        titleText.numberOfLines = 3
        
        doneButton.titleLabel?.font = .systemFont(ofSize: 25)
        doneButton.layer.borderColor = CGColor(srgbRed: 23/255, green: 58/255, blue: 130/255, alpha: 0.8)
        doneButton.setTitleColor(.init(red: 23/255, green: 58/255, blue: 130/255, alpha: 1.0), for: .normal)
        doneButton.layer.borderWidth = 1.5
        doneButton.layer.cornerRadius = 5
        doneButton.setTitle("達成", for: .normal)
        doneButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: viewSize.width * 0.3, bottom: 8, right: viewSize.width * 0.3)
        
        undoButton.titleLabel?.font = .systemFont(ofSize: 25)
        undoButton.layer.borderColor = .init(srgbRed: 153/255, green: 0, blue: 0, alpha: 0.9)
        undoButton.layer.borderWidth = 1.5
        undoButton.layer.cornerRadius = 5
        undoButton.setTitle("断念", for: .normal)
        undoButton.setTitleColor(.init(red: 153/255, green: 0, blue: 0, alpha: 0.9), for: .normal)
        undoButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: viewSize.width * 0.3, bottom: 8, right: viewSize.width * 0.3)
        
        contentText.text = content
        dayCount.text = "目標実行日 \(day)"
        
        if doneCheck[cellCount] {
//            doneButton.isEnabled = false
            doneButton.backgroundColor = .lightGray
            doneButton.setTitle("済み", for: .normal)
        }
        
        backButton.setTitle("×", for: .normal)
        backButton.titleLabel?.font = .systemFont(ofSize: 25)
        backButton.setTitleColor(.white, for: .normal)
        
    }
    @IBAction func doneButtonAction(_ sender: Any) {
        let alert = UIAlertController(title: "目標を達成しましたか？", message: "", preferredStyle: .alert)
        let done = UIAlertAction(title: "はい", style: .default, handler: {
            (action) -> Void in
            self.doneCheck[self.cellCount] = true
            self.doneButton.isEnabled = false
            
            let tabVC = self.presentingViewController as! UITabBarController
            let firstVC = tabVC.selectedViewController as! FirstTabViewController
                firstVC.progressValue[self.cellCount] = firstVC.progressValue[self.cellCount] - 1
            firstVC.doneCheck[self.cellCount] = true
            if !self.doneButton.isEnabled {
                self.doneButton.backgroundColor = .lightGray
                self.doneButton.setTitle("済み", for: .normal)
            }
            let alert = UIAlertController(title: "お疲れ様でした！！", message: "", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                self.dismiss(animated: true, completion: nil)
            }
        })
        let undo = UIAlertAction(title: "いいえ", style: .destructive, handler: {
            (action) -> Void in
            self.doneCheck[self.cellCount] = false
            
            let alert = UIAlertController(title: "ど根性！", message: "", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                self.dismiss(animated: true, completion: nil)
            }
        })
        alert.addAction(done)
        alert.addAction(undo)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func undoButtonAction(_ sender: Any) {
        let alert = UIAlertController(title: "目標を諦めますか？", message: "", preferredStyle: .alert)
        let done = UIAlertAction(title: "はい", style: .default, handler: {
            (action) -> Void in
            self.doneCheck[self.cellCount] = true
            
            //断念を押した場合、遷移元に戻ったらセルを削除する
            let tabVC = self.presentingViewController as! UITabBarController
            let firstVC = tabVC.selectedViewController as! FirstTabViewController
            firstVC.undoCheck[self.cellCount] = true
            firstVC.testArray.remove(at: self.cellCount)
            firstVC.contentArray.remove(at: self.cellCount)
            firstVC.dayArray.remove(at: self.cellCount)
            
            let alert = UIAlertController(title: "時には諦めることも必要です", message: "", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                self.dismiss(animated: true, completion: nil)
            }
        })
        let undo = UIAlertAction(title: "いいえ", style: .destructive, handler: {
            (action) -> Void in
            self.doneCheck[self.cellCount] = false
            let alert = UIAlertController(title: "ど根性！", message: "", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                self.dismiss(animated: true, completion: nil)
            }
        })
        alert.addAction(done)
        alert.addAction(undo)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func closeButtonAction(_ sender: Any) {
        let tabVC = self.presentingViewController as! UITabBarController
        let firstVC = tabVC.selectedViewController as! FirstTabViewController
//        firstVC.progressValue[self.cellCount] = firstVC.progressValue[self.cellCount] - 1
        
        dismiss(animated: true, completion: {
            () -> Void in
            firstVC.tableView.reloadData()
        })
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
