//
//  FancyDishMovieViewController.swift
//  FancyDish
//
//  Created by SHUTO NISHIYAMA on 2021/01/14.
//

import UIKit
import RxSwift
import RxCocoa

class FancyDishMovieViewController: UIViewController {
    
    @IBOutlet weak var moviePostButton: UIBarButtonItem!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    func bind() {
        moviePostButton.rx.tap
            .subscribe { [weak self] _ in
                guard let wself = self else { return }
                let storyboard: UIStoryboard = UIStoryboard(name: "MoviePost", bundle: nil)
                if let navigationVc = storyboard.instantiateInitialViewController() as? UINavigationController,
                    let moviePostVc = navigationVc.topViewController as? MoviePostViewController {
                    wself.present(navigationVc, animated: true, completion: nil)
                }
            }.disposed(by: disposeBag)
    }
 


}

