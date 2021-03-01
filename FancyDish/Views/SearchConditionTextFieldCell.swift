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
    let pickerView: UIPickerView = UIPickerView()
    private var toolBar = UIToolbar()

    override func awakeFromNib() {
        super.awakeFromNib()
        setupPickerView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(_ viewModel: SearchConditionsViewModel) {
        self.viewModel = viewModel

    }
    
    private func setupPickerView() {
        // 決定バーの生成
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        toolBar = toolbar
        textField.inputView = pickerView
        textField.inputAccessoryView = toolbar
    }
    
    @objc func done() {
        textField.endEditing(true)
    }
    
}
