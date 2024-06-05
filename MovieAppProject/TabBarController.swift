//
//  TabBarViewController.swift
//  MovieAppProject
//
//  Created by Joy Kim on 6/4/24.
//

import UIKit

class TabBarController: UITabBarController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }

    func setTabBar() {
        
        let vc1 = MainPageViewController()
        let vc2 = HotContentViewController()
        let vc3 = SavedContentViewController()
        let vc4 = LotteryGameViewController()
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)
        
        setViewControllers([nav1, nav2, nav3, nav4], animated: false)
        
        nav1.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        nav2.tabBarItem = UITabBarItem(title: "NEW & HOT", image: UIImage(systemName: "play.rectangle.on.rectangle"), selectedImage: UIImage(systemName: "play.rectangle.on.rectangle.fill"))
        nav2.tabBarItem.image?.withTintColor(.white)
        
        nav3.tabBarItem = UITabBarItem(title: "저장한 콘텐츠", image: UIImage(systemName: "square.and.arrow.down"), selectedImage: UIImage(systemName: "square.and.arrow.down.fill"))
        nav3.tabBarItem.image?.withTintColor(.white)
        
        nav4.tabBarItem = UITabBarItem(title: "Lottery", image: UIImage(systemName: "gamecontroller"), selectedImage: UIImage(systemName: "gamecontroller.fill") )
        
        vc1.navigationItem.title = "조이킴님"
        vc2.navigationItem.title = "이번 주 Top5"
        vc3.navigationItem.title = "내가 찜한 목록"
        vc4.navigationItem.title = "당첨결과조회"
        
    }
    
}
    

    
    

