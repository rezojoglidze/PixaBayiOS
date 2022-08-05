//
//  RegistrationDIContainer.swift
//  PixaBay
//
//  Created by Rezo Joglidze on 05.08.22.
//

import UIKit

final class RegistrationDIContainer: RegistrationFlowCoordinatorDependencies {
    
    // MARK: - Flow Coordinators
    func makeRegistrationFlowCoordinator(navigationController: UINavigationController) -> RegistrationFlowCoordinator {
        return RegistrationFlowCoordinator(navigationController: navigationController, dependencies: self)
    }
    

    //MARK: Registration View
    func makeRegistrationViewController(actions: RegistrationViewModelActions) -> UIViewController {
        return RegistrationViewController.create(with: makeRegistrationViewModel(actions: actions))
    }
    
    private func makeRegistrationViewModel(actions: RegistrationViewModelActions) -> RegistrationViewModel {
        return DefaultRegistrationViewModel()
    }
    
    // MARK: - Use Cases
    private func makeRegistrationUseCase() -> RegistrationUseCase {
        return DefaultRegistrationUseCase(registrationRepository: makeRegistrationRepository())
    }
    
    // MARK: - Repositories
    private func makeRegistrationRepository() -> RegistrationRepository {
        return DefaultRegistrationRepository.shared
    }
}
