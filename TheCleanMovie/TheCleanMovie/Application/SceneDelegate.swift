//
//  SceneDelegate.swift
//  TheCleanMovie
//
//  Created by Giuliano Accorsi on 03/03/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let tabBar: UITabBarController = {
            let tabBar = UITabBarController()
            tabBar.view.tintColor = .orange
            return tabBar
        }()
        
        let movieScene = MoviesScene()
        
        movieScene.tabBarItem = UITabBarItem(title: "Movies", image: #imageLiteral(resourceName: "icons8-a_home"), selectedImage: #imageLiteral(resourceName: "icons8-home_filled"))
        movieScene.tabBarItem.tag = 0
        
        let favoriteScene = UIViewController()
        favoriteScene.tabBarItem = UITabBarItem(title: "Favorites", image:#imageLiteral(resourceName: "icons8-film_reel"), selectedImage: #imageLiteral(resourceName: "icons8-film_reel_filled"))
        favoriteScene.tabBarItem.tag = 1
        
        let viewControllerList = [ movieScene, favoriteScene ]
        tabBar.viewControllers = viewControllerList.map { UINavigationController(rootViewController: $0)}
        
        MoviesConfigurator.configureModule(viewController: movieScene)
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}
