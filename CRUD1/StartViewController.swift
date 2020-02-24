//
//  StartViewController.swift
//  CRUD1
//
//  Created by Tanaka Soushi on 2020/02/02.
//  Copyright © 2020 Tanaka Soushi. All rights reserved.
//

import UIKit

class StartViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var profileView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textField.delegate = self
        textField2.delegate = self
        textField3.delegate = self
        profileView.layer.cornerRadius = 5
        profileView.layer.backgroundColor = CGColor(srgbRed: 102/255, green: 153/255, blue: 255/255, alpha: 0.2)
        textField.returnKeyType = .done
        textField2.returnKeyType = .done
        textField3.returnKeyType = .done
        textField.textContentType = .emailAddress
        textField2.textContentType = .password
        textField3.textContentType = .password
        textField2.isSecureTextEntry = true
        textField3.isSecureTextEntry = true
    }
    @IBAction func userDefaultSetting(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "launchedBefore")
    }
    @IBAction func goTutorialAction(_ sender: Any) {
        performSegue(withIdentifier: "goTutorial", sender: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        textField2.resignFirstResponder()
        textField3.resignFirstResponder()
        return true
    }
    @IBAction func goMainAction(_ sender: Any) {
        performSegue(withIdentifier: "goMain", sender: nil)
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
