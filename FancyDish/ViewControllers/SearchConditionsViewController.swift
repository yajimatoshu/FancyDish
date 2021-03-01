//
//  SearchConditionsViewController.swift
//  FancyDish
//
//  Created by yajima toshu on 2021/01/27.
//  


import RxSwift
import UIKit

class SearchConditionsViewController: UIViewController {
    
    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak var closeButton: UIBarButtonItem!
    
    private let viewModel = SearchConditionsViewModel()
    private let pickerView: UIPickerView = UIPickerView()
    private let disposeBag = DisposeBag()
    private var toolBar = UIToolbar()

    static func configuredWith() -> UINavigationController? {
        let storyboard: UIStoryboard = UIStoryboard(name: "SearchConditions", bundle: nil)
        if let navigationVc = storyboard.instantiateInitialViewController() as? UINavigationController,
           let viewController = navigationVc.topViewController as? SearchConditionsViewController {
            return navigationVc
        }
        return nil
      }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupPickerView()
        setupTableView()
        setupNavigationBar()
        bind()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "条件検索"
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .systemGray4
        tableView.separatorColor = .systemPurple
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 11)
        tableView.register(UINib(nibName: "SearchConditionTextFieldCell", bundle: nil), forCellReuseIdentifier: "SearchConditionTextFieldCell")
    }
    
    private func setupPickerView() {
        // ピッカー設定
        pickerView.delegate = self
        pickerView.dataSource = self
        
        // 決定バーの生成
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        self.toolBar = toolbar
    }
    
    private func bind() {
        closeButton.rx.tap
            .subscribe { [weak self] _ in
                guard let wself = self else { return }
                wself.dismiss(animated: true, completion: nil)
            }.disposed(by: disposeBag)
        
        viewModel.fetchMiddleArea { [weak self] (result) in
            guard let wself = self else { return }
            wself.tableView.reloadData()
            wself.pickerView.reloadAllComponents()
        }
    }

    @objc private func done() {
        if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 1)) as? SearchConditionTextFieldCell {
            cell.textField.endEditing(true)
        }
        
    }
}

extension SearchConditionsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.sectionTitle(section: section)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchConditionTextFieldCell") as? SearchConditionTextFieldCell {
            switch indexPath.section {
            case 1:
                cell.textField.inputView = pickerView
                cell.textField.inputAccessoryView = toolBar
            default:
                return cell
            }
            return cell
        }
        return UITableViewCell()
    }
}

extension SearchConditionsViewController: UITableViewDelegate {
    
}

extension SearchConditionsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 1)) as? SearchConditionTextFieldCell {
            cell.textField.text = viewModel.middleAreas?[row].name
        }
    }
}

extension SearchConditionsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.middleAreas?.count ?? 0
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.middleAreas?[row].name
    }
    
}
