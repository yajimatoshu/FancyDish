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
    let viewModel = HomeViewModel()

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
        tableView.register(UINib(nibName: "GourmetListCell", bundle: nil), forCellReuseIdentifier: "GourmetListCell")
    }
    
    func bind() {
        viewModel.fetchGourmet { [weak self] (result) in
            guard let wself = self else { return }
            wself.tableView.reloadData()
        }
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
        let storyboard: UIStoryboard = UIStoryboard(name: "GourmetDetail", bundle: nil)
        if let navigationVc = storyboard.instantiateInitialViewController() as? UINavigationController,
           let moviePostVc = navigationVc.topViewController as? GourmetDetailViewController {
            self.present(navigationVc, animated: true, completion: nil)
        }
    }
}
