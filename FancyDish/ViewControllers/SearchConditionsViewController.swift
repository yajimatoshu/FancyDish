//
//  SearchConditionsViewController.swift
//  FancyDish
//
//  Created by yajima toshu on 2021/01/27.
//  


import UIKit

class SearchConditionsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
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
            return cell
        }
        return UITableViewCell()
    }
}

extension SearchConditionsViewController: UITableViewDelegate {
    
}
