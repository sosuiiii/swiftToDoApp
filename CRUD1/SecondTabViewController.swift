//
//  TabWorkListViewController.swift
//  CRUD1
//
//  Created by Tanaka Soushi on 2020/02/09.
//  Copyright © 2020 Tanaka Soushi. All rights reserved.
//

import UIKit

class SecondTabViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    
    @IBOutlet weak var segment: UISegmentedControl!
    var selectSegment = 0
    @IBOutlet weak var tableView: UITableView!
    var firstArray:[String] = []
    var secondArray:[String] = []
    var thirdArray:[String] = []
    var cellCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "SegmentCell", bundle: nil), forCellReuseIdentifier: "segmentCell")
        
        firstArray += ["aa","bb","cc","firstArray"]
        secondArray += ["dd","ee","secondArray"]
        thirdArray += ["gg","thirdArray"]
        
    }
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            selectSegment = 0
            segment.selectedSegmentIndex = 0
        case 1:
            selectSegment = 1
            segment.selectedSegmentIndex = 1
        case 2:
            selectSegment = 2
            segment.selectedSegmentIndex = 2
        default:
            break
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectSegment == 0 {
            cellCount = firstArray.count
        } else if selectSegment == 1 {
            cellCount = secondArray.count
        } else if selectSegment == 2 {
            cellCount = thirdArray.count
        }
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "segmentCell") as! SegmentCell
        if selectSegment == 0 {
            cell.titleLabel = firstArray[indexPath.row]
        } else if selectSegment == 1 {
            cell.titleLabel = secondArray[indexPath.row]
        } else if selectSegment == 2 {
            cell.titleLabel = thirdArray[indexPath.row]
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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
