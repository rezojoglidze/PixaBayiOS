//
//  SceneDelegate.swift
//  PixaBay
//
//  Created by Rezo Joglidze on 05.08.22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    private let appDIContainer = AppDIContainer()
    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene: UIWindowScene = scene as? UIWindowScene else { return }
        
        window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        createAppFlowCoordinator(with: navigationController)
    }
    
    private func createAppFlowCoordinator(with navigationController: UINavigationController) {
        let appFlowCoordinator = AppFlowCoordinator(navigationController: navigationController,
                                                appDIContainer: appDIContainer)
        appFlowCoordinator.start()
    }
}
