//
//  UserViewController.swift
//  MVVM
//
//  Created by Stanislav Lemeshaev on 20.01.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    @IBOutlet weak private var userNameLabel: UILabel!
    @IBOutlet weak private var friendsCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func followButtonPressed(_ sender: Any) {
        print(#function)
    }
}
