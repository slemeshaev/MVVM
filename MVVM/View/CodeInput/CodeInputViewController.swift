//
//  CodeInputViewController.swift
//  MVVM
//
//  Created by Stanislav Lemeshaev on 22.01.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit
import Bond

class CodeInputViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var inputTextField: UITextField!
    @IBOutlet weak private var submitButton: UIButton!
    
    // MARK: - Properties
    var viewModel: CodeInputViewModel?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
    }
    
    // MARK: - IBActions
    @IBAction private func textFieldEditingChanged(_ sender: Any) {
        viewModel?.handleCodeChanged(inputTextField.text ?? "")
    }
    
    @IBAction private func submitButtonPressed(_ sender: Any) {
        print(#function)
    }
    
    // MARK: - Private
    private func fillData() {
        viewModel?.title.bind(to: titleLabel)
        viewModel?.submitButtonEnabled.bind(to: submitButton.reactive.isEnabled)
    }
}
