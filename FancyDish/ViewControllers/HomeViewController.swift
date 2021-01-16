//
//  ViewController.swift
//  FancyDish
//
//  Created by SHUTO NISHIYAMA on 2021/01/12.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {
    
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

