//
//  RegistrationUseCase.swift
//  PixaBay
//
//  Created by Rezo Joglidze on 05.08.22.
//

import Foundation

protocol RegistrationUseCase {
    func register(_ firstName: String, _ surname: String, _ phoneNumber: String, _ mail: String, _ school: String, _ schoolGrade: String,
                  completion: @escaping (Result<Int, Error>) -> Void) -> Void
}

final class DefaultRegistrationUseCase: RegistrationUseCase {
    
    private let registrationRepository: RegistrationRepository
    
    init(registrationRepository: RegistrationRepository) {
        self.registrationRepository = registrationRepository
    }
    
    func register(_ firstName: String, _ surname: String, _ phoneNumber: String, _ mail: String, _ school: String, _ schoolGrade: String,
        completion: @escaping (Result<Int, Error>) -> Void) -> Void {
        registrationRepository.register(firstName, surname, phoneNumber, mail, school, schoolGrade, completion: { result in
            
            completion(result)
        })
    }
}
