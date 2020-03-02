//
//  RegisterViewController.swift
//  CRUD1
//
//  Created by Tanaka Soushi on 2020/03/02.
//  Copyright © 2020 Tanaka Soushi. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var hedder: UIView!
    @IBOutlet weak var hedderLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    }
    @IBAction func registerButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func backButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
