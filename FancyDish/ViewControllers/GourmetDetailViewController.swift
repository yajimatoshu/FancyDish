//
//  GourmetViewController.swift
//  FancyDish
//
//  Created by yajima toshu on 2021/01/18.
//  


import UIKit
import AlamofireImage

class GourmetDetailViewController: UIViewController {
    
    @IBOutlet weak var shopImageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    
    private let viewModel = GourmetDetailViewModel()
    
    static func configuredWith(shop: GourmetResponseResults.Shop) -> UINavigationController? {
        let storyboard: UIStoryboard = UIStoryboard(name: "GourmetDetail", bundle: nil)
        if let navigationVc = storyboard.instantiateInitialViewController() as? UINavigationController,
           let viewController = navigationVc.topViewController as? GourmetDetailViewController {
            viewController.viewModel.gourmetDetail = shop
            return navigationVc
        }
        return nil
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupNavigationBar()
        setupLabel()

    }
    
    private func setupNavigationBar() {
        navigationItem.title = viewModel.shopName
    }
    
    private func setupLabel() {
        addressLabel.numberOfLines = 0
        addressLabel.text = viewModel.address
    }
    
    private func setup() {
        shopImageView.af.setImage(withURL: viewModel.imageUrl)
    }
    

}
