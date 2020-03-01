//
//  CustomTableViewCell.swift
//  CRUD1
//
//  Created by Tanaka Soushi on 2020/02/25.
//  Copyright © 2020 Tanaka Soushi. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var titleText: UILabel!
    var testText = ""
    @IBOutlet weak var contentText: UILabel!
    var content = ""
    @IBOutlet weak var progressView: UIProgressView!
    var progress = 0
    @IBOutlet weak var progressLabel: UILabel!
    var progressText = ""
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected statea
        
//        let cellVC = FirstTabViewController()
        titleText.text = testText
        titleText.frame.size.width = self.frame.size.width * 0.8
        titleText.textAlignment = .center
        contentText.text = content
        contentText.frame.size.width = self.frame.size.width * 0.8
        progressLabel.text = progressText
        progressView.tintColor = .green
        if progressView.progress < 0.33 {
            progressView.tintColor = .red
        } else if progressView.progress < 0.66 {
            progressView.tintColor = .yellow
        }

//        progressView.frame.size.width = UIScreen.main.bounds.size.width * 1.5
//        let sizeFit = self.frame.size.width * 0.8 / progressView.frame.size.width
//        progressView.transform = CGAffineTransform(scaleX: 1.5, y: 1.0)
//        progressView.progress * 1.5
    }
    
    
}
