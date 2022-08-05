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
