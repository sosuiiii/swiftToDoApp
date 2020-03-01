//
//  TabMyPageViewController.swift
//  CRUD1
//
//  Created by Tanaka Soushi on 2020/02/09.
//  Copyright © 2020 Tanaka Soushi. All rights reserved.
//

import UIKit

class ThirdTabViewController: UIViewController {

    @IBOutlet weak var hedder: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var hedderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        contentView.layer.cornerRadius = 20
        contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner,.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
        contentView.backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 0.05)
        
        hedder.backgroundColor = .init(red: 23/255, green: 58/255, blue: 130/255, alpha: 0.8)
        hedderLabel.textColor = .white
        hedderLabel.font = .boldSystemFont(ofSize: 20.0)
        hedderLabel.text = "これまでの実績"
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
