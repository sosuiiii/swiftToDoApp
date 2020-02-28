//
//  SegmentSecondViewController.swift
//  CRUD1
//
//  Created by Tanaka Soushi on 2020/02/26.
//  Copyright © 2020 Tanaka Soushi. All rights reserved.
//

import UIKit

class SegmentSecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var selectSegment = 0
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        segmentControl.selectedSegmentIndex = 1
        
    }
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            selectSegment = 0
//            performSegue(withIdentifier: "first", sender: nil)
            dismiss(animated: true, completion: nil)
        case 2:
            selectSegment = 2
            performSegue(withIdentifier: "third", sender: nil)
        default:
            break
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
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
