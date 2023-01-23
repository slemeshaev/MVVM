//
//  CodeInputViewModel.swift
//  MVVM
//
//  Created by Stanislav Lemeshaev on 22.01.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import Bond
import Foundation

protocol CodeInputViewModel {
    var title: Observable<String> { get }
    var submitButtonEnabled: Observable<Bool> { get }
    
    func handleCodeChanged(_ code: String)
}

class CodeInputViewModelImpl: CodeInputViewModel {
    // MARK: - Init
    init(model: CodeInputModel) {
        self.model = model
        self.title.value = "Enter a \(model.codeLength)-character code"
    }
    
    // MARK: - Properties
    private let model: CodeInputModel
    
    // MARK: - CodeInputViewModel
    var title = Observable<String>("")
    var submitButtonEnabled = Observable<Bool>(false)
    
    var submitButtonEnabledChanged: ((Bool) -> ())?
    
    func handleCodeChanged(_ code: String) {
        submitButtonEnabled.value = model.isCodeValid(code)
    }
}
