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
        
        // ホーム画面
        let homeSB = UIStoryboard(name: "Home", bundle: nil)
        if let homeVC = homeSB.instantiateInitialViewController() as? UINavigationController{
            homeVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
            viewControllers.append(homeVC)
        }
        
        let fancyDishMovieSB = UIStoryboard(name: "FancyDishMovie", bundle: nil)
        if let fancyDishMovieVC = fancyDishMovieSB.instantiateInitialViewController() as? UINavigationController{
            fancyDishMovieVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 2)
            viewControllers.append(fancyDishMovieVC)
        }
        
        setViewControllers(viewControllers, animated: false)
    }
}
