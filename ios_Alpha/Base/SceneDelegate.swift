//
//  SceneDelegate.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 09.10.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
//        let presenter = BeersPresenter()
        let interactor = BeersInteractor()
        let router = BeersRouter()
        let presenter = BeersPresenter()
        let rootVC = BeersViewController()
        rootVC.interactor?.presenter = presenter
        rootVC.interactor = interactor
        rootVC.router = router
        window = UIWindow(windowScene: scene)
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {}
    
    func sceneDidBecomeActive(_ scene: UIScene) {}
    
    func sceneWillResignActive(_ scene: UIScene) {}
    
    func sceneWillEnterForeground(_ scene: UIScene) {}
    
    func sceneDidEnterBackground(_ scene: UIScene) {}
}

