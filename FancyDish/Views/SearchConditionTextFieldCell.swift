//
//  SearchConditionTextFieldCell.swift
//  FancyDish
//
//  Created by yajima toshu on 2021/01/28.
//  


import UIKit

class SearchConditionTextFieldCell: UITableViewCell {
    @IBOutlet weak var textField: UITextField!
    private var viewModel: SearchConditionsViewModel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(_ viewModel: SearchConditionsViewModel) {
        self.viewModel = viewModel
    }
    
}
