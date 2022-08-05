//
//  RegistrationViewController.swift
//  PixaBay
//
//  Created by Rezo Joglidze on 05.08.22.
//

import UIKit

class RegistrationViewController: UIViewController {

    private var viewModel: RegistrationViewModel!

    // MARK: - Lifecycle
    static func create(with viewModel: RegistrationViewModel) -> RegistrationViewController {
        let viewController: RegistrationViewController = .init()
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
