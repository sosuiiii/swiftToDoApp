//
//  RegisterViewController.swift
//  CRUD1
//
//  Created by Tanaka Soushi on 2020/03/02.
//  Copyright © 2020 Tanaka Soushi. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var hedder: UIView!
    @IBOutlet weak var hedderLabel: UILabel!
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var formatter = DateFormatter()
    var dateArray:[String]? = []
    
    var num = ["1","2","3"]
    var num2 = ["1","2","3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let y = pickerView.bounds.size.height / 3
        let x = pickerView.bounds.size.width
        let titleLabel = UILabel()
        titleLabel.frame = CGRect(x: x / 1.4 + 20, y: y - 3, width: UIScreen.main.bounds.size.width, height: 44)
        titleLabel.text = "日"
        
        let label = UILabel()
        label.frame = CGRect(x: x / 3, y: y, width: UIScreen.main.bounds.size.width, height: 44)
        label.text = "回"
        label.textColor = UIColor.black
        
        pickerView.addSubview(titleLabel)
        pickerView.addSubview(label)
        
        textField1.delegate = self
        textField2.delegate = self
        textField1.returnKeyType = .done
        textField2.returnKeyType = .done
        // ピッカー設定
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.tag = 2
        
        hedder.backgroundColor = .init(red: 23/255, green: 58/255, blue: 130/255, alpha: 0.8)
        hedderLabel.text = "目標登録"
        hedderLabel.frame.size.width = view.frame.size.width * 0.8
        hedderLabel.textColor = .white
        hedderLabel.font = .boldSystemFont(ofSize: 20.0)
        
        let viewSize = view.frame.size
        registerButton.titleLabel?.font = .systemFont(ofSize: 25)
        registerButton.layer.borderColor = CGColor(srgbRed: 23/255, green: 58/255, blue: 130/255, alpha: 0.8)
        registerButton.setTitleColor(.init(red: 23/255, green: 58/255, blue: 130/255, alpha: 1.0), for: .normal)
        registerButton.layer.borderWidth = 1.5
        registerButton.layer.cornerRadius = 5
        registerButton.setTitle("登録", for: .normal)
        registerButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: viewSize.width * 0.3, bottom: 8, right: viewSize.width * 0.3)
        
        backButton.titleLabel?.font = .systemFont(ofSize: 25)
        backButton.layer.borderColor = CGColor(srgbRed: 153/255, green: 0, blue: 0, alpha: 0.9)
        backButton.setTitleColor(.init(red: 153/255, green: 0, blue: 0, alpha: 0.9), for: .normal)
        backButton.layer.borderWidth = 1.5
        backButton.layer.cornerRadius = 5
        backButton.setTitle("戻る", for: .normal)
        backButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: viewSize.width * 0.3, bottom: 8, right: viewSize.width * 0.3)
        var v = 4
        for _ in 0...26 {
            num.append("\(v)")
            num2.append("\(v)")
            v += 1
        }
        
    }
    @IBAction func registerButtonAction(_ sender: Any) {
        
        let tabVC = self.presentingViewController as! UITabBarController
        let firstVC = tabVC.selectedViewController as! FirstTabViewController
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "ydMMM", options: 0, locale: Locale(identifier: "ja_JP"))
        let dateFormat = formatter.string(from: Date())
        var date = dateFormat.replacingOccurrences(of: "年", with: "/")
        date = date.replacingOccurrences(of: "月", with: "/")
        date = date.replacingOccurrences(of: "日", with: "")
        dateArray?.append(date)
        firstVC.dayArray.append(date)
        dismiss(animated: true, completion: {
            () -> Void in
            firstVC.tableView.reloadData()
        }) 
    }
    @IBAction func backButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField1.resignFirstResponder()
        textField2.resignFirstResponder()
        return true
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        let num = [0...30]
        return num.count
    }
    //ドラムロールの列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 1 {
           return num2[row]
        } else {
           return num[row]
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
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
