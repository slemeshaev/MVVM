//
//  CodeInputViewModel.swift
//  MVVM
//
//  Created by Stanislav Lemeshaev on 22.01.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import Foundation

protocol CodeInputViewModel {
    var title: String { get }
    var submitButtonEnabled: Bool { get }
    var submitButtonEnabledChanged: ((Bool) -> ())? { get set }
    
    func handleCodeChanged(_ code: String)
}

class CodeInputViewModelImpl: CodeInputViewModel {
    // MARK: - Init
    init(model: CodeInputModel) {
        self.model = model
    }
    
    // MARK: - Properties
    private let model: CodeInputModel
    
    // MARK: - CodeInputViewModel
    var title: String {
        return "Enter a \(model.codeLength)-character code"
    }
    
    var submitButtonEnabled: Bool = false {
        didSet {
            submitButtonEnabledChanged?(submitButtonEnabled)
        }
    }
    
    var submitButtonEnabledChanged: ((Bool) -> ())?
    
    func handleCodeChanged(_ code: String) {
        submitButtonEnabled = model.isCodeValid(code)
    }
}
