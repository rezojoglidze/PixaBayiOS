//
//  AppFlowCoordinator.swift
//  PixaBay
//
//  Created by Rezo Joglidze on 05.08.22.
//

import UIKit

final class AppFlowCoordinator {
    private let navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    
    init(navigationController: UINavigationController,
         appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer

    }
    
    func start() {
        // In App Flow we can check if user needs to login, if yes we would run login flow
        let registrationDIContainer = appDIContainer.makeRegistrationDIContainer()
        let flow = registrationDIContainer.makeRegistrationFlowCoordinator(navigationController: navigationController)
        flow.start()
    }
}
