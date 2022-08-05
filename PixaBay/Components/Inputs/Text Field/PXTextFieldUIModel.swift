//
//  PXTextFieldUIModel.swift
//  PixaBay
//
//  Created by Rezo Joglidze on 05.08.22.
//

import UIKit

// MARK: - PX Text Field UI Model
struct PXTextFieldUIModel {
    
    // MARK: Properties
    var layout: Layout = .init()
    var colors: Colors = .init()
    var misc: Misc = .init()
    
    
    // MARK: Layout
    struct Layout {
        let height: CGFloat = 50
        let cornerRadius: CGFloat = 10
        let borderWidth: CGFloat = 1
        
        var textAlignment: NSTextAlignment = .natural
    }
    
    // MARK: Colors
    struct Colors {
        var placeholder: UIColor = .gray.withAlphaComponent(0.8)

    }
    
    // MARK: Misc
    struct Misc {
        var isSecure: Bool = false

        var keyboardType: UIKeyboardType = .default
        
        var autocorrectionType: UITextAutocorrectionType = .default
        var autocapitalizationType: UITextAutocapitalizationType = .none
    }
}

// MARK: - Factory
extension PXTextFieldUIModel {
    fileprivate init(center: Bool) {
        self.init()
        layout.textAlignment = center ? .center : .natural
    }
    
    static func email(center: Bool = false) -> PXTextFieldUIModel {
        var uiModel: PXTextFieldUIModel = .init(center: center)
        uiModel.misc.keyboardType = .emailAddress
        uiModel.misc.autocorrectionType = .no
        uiModel.misc.autocapitalizationType = .none
        return uiModel
    }
    
    static func password(center: Bool = false) -> PXTextFieldUIModel {
        var uiModel: PXTextFieldUIModel = .init(center: center)
        uiModel.misc.isSecure = true
        uiModel.misc.autocorrectionType = .no
        uiModel.misc.autocapitalizationType = .none
        return uiModel
    }
}
