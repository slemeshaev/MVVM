//
//  CodeInputModel.swift
//  MVVM
//
//  Created by Stanislav Lemeshaev on 22.01.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import Foundation

protocol CodeInputModel {
    var codeLength: Int { get }
    func isCodeValid(_ code: String) -> Bool
}

class CodeInputModelImpl: CodeInputModel {
    var codeLength: Int {
        return 4
    }
    
    func isCodeValid(_ code: String) -> Bool {
        return code.count == codeLength
    }
}
