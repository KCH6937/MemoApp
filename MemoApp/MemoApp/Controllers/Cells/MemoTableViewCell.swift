//
//  MemoTableViewCell.swift
//  MemoApp
//
//  Created by 강채현 on 2021/11/12.
//

import UIKit

class MemoTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    
    static let identifier = "MemoTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config() {
        self.backgroundColor = .appColor(.headerColor)
        self.titleLabel.textColor = .white
        self.dateLabel.textColor = .gray
        self.contentLabel.textColor = .gray
    }
    
}
