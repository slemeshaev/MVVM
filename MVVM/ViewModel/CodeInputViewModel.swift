//
//  CodeInputViewModel.swift
//  MVVM
//
//  Created by Stanislav Lemeshaev on 22.01.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import Foundation
import RxSwift

protocol CodeInputViewModel {
    var title: String { get }
    var submitButtonEnabled: BehaviorSubject<Bool> { get }
    
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
    
    var submitButtonEnabled: BehaviorSubject<Bool> = BehaviorSubject(value: false)
    
    func handleCodeChanged(_ code: String) {
        submitButtonEnabled.onNext(model.isCodeValid(code))
    }
}
