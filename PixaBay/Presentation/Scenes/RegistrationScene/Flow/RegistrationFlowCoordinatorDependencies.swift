//
//  RegistrationFlowCoordinatorDependencies.swift
//  PixaBay
//
//  Created by Rezo Joglidze on 05.08.22.
//

import UIKit

protocol RegistrationFlowCoordinatorDependencies {
    func makeRegistrationViewController(actions: RegistrationViewModelActions) -> UIViewController
}

final class RegistrationFlowCoordinator {
    private weak var navigationController: UINavigationController?
    private let dependencies: RegistrationFlowCoordinatorDependencies
    
    init(navigationController: UINavigationController,
         dependencies: RegistrationFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        // Note: here we keep strong reference with actions, this way this flow do not need to be strong referenced
        let actions = RegistrationViewModelActions()
        let vc = dependencies.makeRegistrationViewController(actions: actions)
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        navigationController?.pushViewController(vc, animated: true)
    }
}
