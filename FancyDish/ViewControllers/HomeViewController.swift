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
        // Do any additional setup after loading the view.
        bind()
    }
    
    func bind() {
        viewModel.fetchGourmet { [weak self] (result) in
            print(result)
        }
    }


}

