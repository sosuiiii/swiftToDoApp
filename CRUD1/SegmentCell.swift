//
//  SegmentCell.swift
//  CRUD1
//
//  Created by Tanaka Soushi on 2020/02/27.
//  Copyright © 2020 Tanaka Soushi. All rights reserved.
//

import UIKit

class SegmentCell: UITableViewCell {
    
    
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var contentText: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressText: UILabel!
    var titleLabel = "test"
    var contentLabel = "test"
    var progress = "test"
    var progressLabel = "test"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        titleText.text = titleLabel
        contentText.text = contentLabel
        progressText.text = progressLabel
    }
    
}
