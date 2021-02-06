//
//  SearchConditionsViewController.swift
//  FancyDish
//
//  Created by yajima toshu on 2021/01/27.
//  


import UIKit

class SearchConditionsViewController: UIViewController {
    
    @IBOutlet weak private var tableView: UITableView!
    private let viewModel = SearchConditionsViewModel()
    private let pickerView: UIPickerView = UIPickerView()
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
        
        setupTableView()
        setupNavigationBar()
        setupPickerView()
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
        viewModel.fetchMiddleArea { [weak self] (result) in
            guard let wself = self else { return }
            wself.tableView.reloadData()
        }
    }

    @objc private func done() {
        
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
            switch indexPath.row {
            case 0:
                return cell
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
    
}

extension SearchConditionsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        <#code#>
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        <#code#>
    }
    
    
}
