//
//  cellSettingViewController.swift
//  CRUD1
//
//  Created by Tanaka Soushi on 2020/02/25.
//  Copyright © 2020 Tanaka Soushi. All rights reserved.
//

import UIKit

class cellSettingViewController: UIViewController {

    @IBOutlet weak var titleText: UILabel!
    var testText = ""
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var undoButton: UIButton!
    var doneCheck = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewSize = view.frame.size
        // Do any additional setup after loading the view.
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
        
    }
    @IBAction func doneButtonAction(_ sender: Any) {
        alert("目標を達成しましたか？", done: "はい", "お疲れ様でした！！！", undo: "いいえ", "もう一息です！")
        if doneCheck {
            
        }
    }
    @IBAction func undoButtonAction(_ sender: Any) {
        alert("目標を諦めますか？", done: "はい", "時には諦めることも必要です", undo: "いいえ", "ど根性！！")
    }
    
    func alert(_ title:String, done:String, _ doneMessage: String, undo:String, _ undoMessage:String) {
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let done = UIAlertAction(title: done, style: .default, handler: {
            (action) -> Void in
            self.doneCheck = true
            let alert = UIAlertController(title: doneMessage, message: "", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.dismiss(animated: true, completion: nil)
            }
        })
        let undo = UIAlertAction(title: undo, style: .destructive, handler: {
            (action) -> Void in
            self.doneCheck = false
            let alert = UIAlertController(title: undoMessage, message: "", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.dismiss(animated: true, completion: nil)
            }
        })
        alert.addAction(done)
        alert.addAction(undo)
        present(alert, animated: true, completion: nil)
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
