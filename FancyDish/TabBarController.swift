//
//  TabBarController.swift
//  FancyDish
//
//  Created by SHUTO NISHIYAMA on 2021/01/13.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ページを格納する配列
        var viewControllers: [UIViewController] = []
        
        // 1ページ目になるViewController
        let firstSB = UIStoryboard(name: "Home", bundle: nil)
        let firstVC = firstSB.instantiateInitialViewController()! as UINavigationController
        firstVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        viewControllers.append(firstVC)
        
        setViewControllers(viewControllers, animated: false)
    }
}
