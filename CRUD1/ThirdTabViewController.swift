//
//  TabMyPageViewController.swift
//  CRUD1
//
//  Created by Tanaka Soushi on 2020/02/09.
//  Copyright © 2020 Tanaka Soushi. All rights reserved.
//

import UIKit

class ThirdTabViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        contentView.layer.cornerRadius = 15
        contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner,.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
        
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
