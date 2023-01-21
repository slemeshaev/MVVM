//
//  UserViewController.swift
//  MVVM
//
//  Created by Stanislav Lemeshaev on 20.01.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak private var userNameLabel: UILabel!
    @IBOutlet weak private var friendsCountLabel: UILabel!
    
    // MARK: - Properties
    var viewModel: UserViewModel?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
    }
    
    // MARK: - IBActions
    @IBAction private func followButtonPressed(_ sender: Any) {
        viewModel?.handleFollow()
    }
    
    // MARK: - Private
    private func fillData() {
        userNameLabel.text = viewModel?.username
        friendsCountLabel.text = viewModel?.friendsCountDescription
    }
}
