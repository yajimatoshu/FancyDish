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
            print("testaaa" + wself.viewModel.shopsCount.description)
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
            return cell
        }
        return UITableViewCell()
    }
}

extension HomeViewController: UITableViewDelegate {
}
