//
//  AppDIContainer.swift
//  PixaBay
//
//  Created by Rezo Joglidze on 05.08.22.
//

import Foundation

final class AppDIContainer {
    
    //MARK: DIContainers fo scenes
    
    func makeRegistrationDIContainer() -> RegistrationDIContainer {
        return RegistrationDIContainer()
    }
}
