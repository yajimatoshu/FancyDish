//
//  GourmetListCell.swift
//  FancyDish
//
//  Created by yajima toshu on 2021/01/17.
//  


import UIKit

class GourmetListCell: UITableViewCell {
    
    @IBOutlet weak var shopNameLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        shopNameLabel.numberOfLines = 0
        budgetLabel.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
