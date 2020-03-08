//
//  TabWorkListViewController.swift
//  CRUD1
//
//  Created by Tanaka Soushi on 2020/02/09.
//  Copyright © 2020 Tanaka Soushi. All rights reserved.
//

import UIKit

class SecondTabViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var hedderLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var hedder: UIView!
    @IBOutlet weak var segment: UISegmentedControl!
    var selectSegment = 0
    @IBOutlet weak var tableView: UITableView!
    var firstArray:[cellTuple] = []
    var secondArray:[cellTuple] = []
    var thirdArray:[cellTuple] = []
    var cellCount = 0
    typealias cellTuple = (title:String , message:String)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        hedder.backgroundColor = .init(red: 23/255, green: 58/255, blue: 130/255, alpha: 0.8)
        
        hedderLabel.text = "目標管理"
        hedderLabel.textColor = .white
        hedderLabel.font = .boldSystemFont(ofSize: 20)
//        hedderLabel.font = .systemFont(ofSize: 25)
        
        segment.setTitle("待機中", forSegmentAt: 0)
        segment.setTitle("達成済み", forSegmentAt: 1)
        segment.setTitle("未達成", forSegmentAt: 2)
        segment.backgroundColor = .init(red: 23/255, green: 58/255, blue: 130/255, alpha: 0.8)
        segment.selectedSegmentTintColor = .white
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 23/255, green: 58/255, blue: 130/255, alpha: 0.8)], for: .selected)
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        
        tableView.register(UINib(nibName: "SegmentCell", bundle: nil), forCellReuseIdentifier: "segmentCell")
        
        firstArray += [
            (title:"aa", message:"aaMessage"),
            (title:"bb", message:"bbMessage"),
            (title:"cc", message:"ccMessage"),
            (title:"firstArray", message:"firstArrayMessage"),
        ]
        secondArray += [
            (title:"dd", message:"ddMessage"),
            (title:"ee", message:"eeMessage"),
            (title:"secondArray", message:"secondArrayMessage"),
        ]
        thirdArray += [
            (title:"gg", message:"ggMessage"),
            (title:"thirdArray", message:"thirdArrayMessage"),
        ]
        
        addButton.setTitle("＋", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 25)
        
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
    @IBAction func addButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "register", sender: nil)
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
            cell.titleLabel = firstArray[indexPath.row].title
            cell.contentLabel = firstArray[indexPath.row].message
            cell.accessoryType = .checkmark
        } else if selectSegment == 1 {
            cell.titleLabel = secondArray[indexPath.row].title
            cell.contentLabel = secondArray[indexPath.row].message
            cell.accessoryType = .none
            
        } else if selectSegment == 2 {
            cell.titleLabel = thirdArray[indexPath.row].title
            cell.contentLabel = thirdArray[indexPath.row].message
            cell.accessoryType = .none
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alert = UIAlertController(title: "この目標にチャレンジしますか？", message: "", preferredStyle: .alert)
        let yes = UIAlertAction(title: "はい", style: .default, handler: {
            (alert) -> Void in
        })
        let no = UIAlertAction(title: "いいえ", style: .destructive, handler: {
            (alert) -> Void in
        })
        alert.addAction(yes)
        alert.addAction(no)
        present(alert, animated: true, completion: nil)
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
