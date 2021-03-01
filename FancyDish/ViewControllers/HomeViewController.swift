//
//  ViewController.swift
//  FancyDish
//
//  Created by yajima toshu on 2021/01/12.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var rightBarButton: UIBarButtonItem!

    let viewModel = HomeViewModel()
    let genre: String?
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        setupTableView()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "検索結果一覧"
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = .systemPurple
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 11)
        tableView.register(UINib(nibName: "GourmetListCell", bundle: nil), forCellReuseIdentifier: "GourmetListCell")
    }
    
    func bind() {
        viewModel.fetchGourmet { [weak self] (result) in
            guard let wself = self else { return }
            wself.tableView.reloadData()
        }
        
        rightBarButton.rx.tap
            .subscribe { [weak self] _ in
                guard let wself = self else { return }
                guard let navigationController = SearchConditionsViewController.configuredWith() else {
                    return
                }
                wself.present(navigationController, animated: true, completion: nil)
            }.disposed(by: disposeBag)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.shopsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GourmetListCell") as? GourmetListCell {
            cell.shopNameLabel.text = viewModel.gourmetResults?.shop[indexPath.row].name
            cell.budgetLabel.text = viewModel.gourmetResults?.shop[indexPath.row].budget.average
            return cell
        }
        return UITableViewCell()
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let gourmetResults = viewModel.gourmetResults, let navigationController = GourmetDetailViewController.configuredWith(shop: gourmetResults.shop[indexPath.row]) else {
            return
        }
        present(navigationController, animated: true, completion: nil)
    }
}
