//
//  PXTextField.swift
//  PixaBay
//
//  Created by Rezo Joglidze on 05.08.22.
//

import UIKit

// MARK: - PX Text Field
final class PXTextField: UIView, UITextFieldDelegate {
    
    // MARK: Subviews
    private lazy var backgroundView: UIView = {
        let view: UIView = .init()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        return view
    }()
    
    private lazy var textField: UITextField = {
        let textField: UITextField = .init()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.addTarget(self, action: #selector(textFieldDidChangeText), for: .editingChanged)
        textField.backgroundColor = .clear
        return textField
    }()
    
    // MARK: Properties
    private var uiModel: PXTextFieldUIModel
    weak var delegate: PXTextFieldDelegate?
    var text: String { textField.text ?? "" }

    
    // MARK: Initializers
    init(
        uiModel: PXTextFieldUIModel = .init()
    ) {
        self.uiModel = uiModel
        super.init(frame: .zero)
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    // MARK: Setup
    private func setUp() {
        addSubviews()
        setUpLayout()
    }
    
    private func addSubviews() {
        addSubview(backgroundView)
        backgroundView.addSubview(textField)
    }
    
    private func setUpLayout() {
        NSLayoutConstraint.activate([
            backgroundView.leftAnchor.constraint(equalTo: leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: rightAnchor),
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            textField.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            textField.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20)
        ])
    }
    
    // MARK: Configuration - Parameters
    func configure(placeholder: String) {
        textField.attributedPlaceholder = .init(
            string: placeholder,
            attributes: [.foregroundColor: uiModel.colors.placeholder as Any]
        )
    }
    
    // MARK: Text Field Delegate
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        delegate?.pxTextFieldShouldChangeCharacters(in: range, replacementString: string, sender: self) ??
        true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        configureFromStateUIModelChange()
        delegate?.pxTextFieldDidBeginEditing(sender: self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.pxTextFieldDidCommitText(text, sender: self)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
//        configureFromStateUIModelChange()
        delegate?.pxTextFieldDidEndEditing(sender: self)
    }
    
    // MARK: Actions
    @objc private func textFieldDidChangeText() {
//        configureFromStateUIModelChange()
        delegate?.pxTextFieldDidChangeText(to: text, sender: self)
    }
}
