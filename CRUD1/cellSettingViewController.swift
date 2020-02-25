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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleText.text = testText
        titleText.frame.size.width = view.frame.size.width * 0.8
        titleText.textAlignment = .center
        titleText.numberOfLines = 3
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
