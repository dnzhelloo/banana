//
//  SceneDelegate.swift
//  banana
//
//  Created by Deniz on 4.06.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = createTabBar()
        window?.makeKeyAndVisible()
    }
    
    func createHomeNC()->UINavigationController{
        let newsVC = NewsVC()
        newsVC.title = "News"
        if let newspaperImage = UIImage(systemName: "newspaper") {
            newsVC.tabBarItem = UITabBarItem(title: "News", image: newspaperImage, tag: 0)
        }
        
        return UINavigationController(rootViewController: newsVC)
    }
    
    func createSearchVC()->UINavigationController{
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createListVC()->UINavigationController{
        let listVC = ListVC()
        listVC.title = "List"
        
        if let listImage = UIImage(systemName: "bookmark") {
            listVC.tabBarItem = UITabBarItem(title: "List", image: listImage, tag: 2)
        }
        
        return UINavigationController(rootViewController: listVC)
    }
    
    func createTabBar()->UITabBarController{
        let tabbar = UITabBarController()
        tabbar.viewControllers = [createHomeNC(),createSearchVC(),createListVC()]
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = .systemBackground
       
        
        tabbar.tabBar.standardAppearance = tabBarAppearance
        tabbar.tabBar.scrollEdgeAppearance = tabBarAppearance
        
        return tabbar
    }
}

