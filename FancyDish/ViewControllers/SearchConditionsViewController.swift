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
    
    private let disposeBag = DisposeBag()
    private let viewModel = SearchConditionsViewModel()

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
    
    private func bind() {
        closeButton.rx.tap
            .subscribe { [weak self] _ in
                guard let wself = self else { return }                
                wself.dismiss(animated: true, completion: nil)
            }.disposed(by: disposeBag)
        
        viewModel.fetchMiddleArea { [weak self] (result) in
            guard let wself = self else { return }
            wself.tableView.reloadData()
            if let cell = wself.tableView.cellForRow(at: IndexPath(row: 0, section: 1)) as? SearchConditionTextFieldCell {
                cell.pickerView.reloadAllComponents()
            }
        }
        
        viewModel.fetchGenre { [weak self] (result) in
            guard let wself = self else { return }
            wself.tableView.reloadData()
            if let cell = wself.tableView.cellForRow(at: IndexPath(row: 0, section: 2)) as? SearchConditionTextFieldCell {
                cell.pickerView.reloadAllComponents()
            }
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
            cell.pickerView.delegate = self
            cell.pickerView.dataSource = self
            cell.pickerView.tag = indexPath.section
            switch indexPath.section {
            case 1:
                return cell
            case 2:
                return cell
            default:
                return cell
            }
        }
        return UITableViewCell()
    }
}

extension SearchConditionsViewController: UITableViewDelegate {
    
}

extension SearchConditionsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 1)) as? SearchConditionTextFieldCell, pickerView.tag == 1 {
            cell.textField.text = viewModel.middleAreas?[row].name
        }
        if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 2)) as? SearchConditionTextFieldCell, pickerView.tag == 2 {
            cell.textField.text = viewModel.genres?[row].name
        }
    }
}

extension SearchConditionsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return viewModel.middleAreas?.count ?? 0
        case 2:
            return viewModel.genres?.count ?? 0
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return viewModel.middleAreas?[row].name
        case 2:
            return viewModel.genres?[row].name
        default:
            return nil
        }

    }
    
}
