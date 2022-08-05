//
//  PXTextFieldDelegate.swift
//  PixaBay
//
//  Created by Rezo Joglidze on 05.08.22.
//

import Foundation

// MARK: - PX TextField Delegate
protocol PXTextFieldDelegate: AnyObject {
    func pxTextFieldShouldChangeCharacters(
        in range: NSRange,
        replacementString string: String,
        sender textField: PXTextField
    ) -> Bool
    
    func pxTextFieldDidChangeText(to text: String, sender textField: PXTextField)
    
    func pxTextFieldDidBeginEditing(sender textField: PXTextField)
    func pxTextFieldDidCommitText(_ text: String, sender textField: PXTextField)
    func pxTextFieldDidEndEditing(sender textField: PXTextField)
}

extension PXTextFieldDelegate {
    func pxTextFieldShouldChangeCharacters(
        in range: NSRange,
        replacementString string: String,
        sender textField: PXTextField
    ) -> Bool {
        true
    }
    
    func pxTextFieldDidChangeText(to text: String, sender textField: PXTextField) {}
    
    func pxTextFieldDidBeginEditing(sender textField: PXTextField) {}
    func pxTextFieldDidEndEditing(sender textField: PXTextField) {}
}
