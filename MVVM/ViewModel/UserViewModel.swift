//
//  UserViewModel.swift
//  MVVM
//
//  Created by Stanislav Lemeshaev on 21.01.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import Foundation

protocol UserViewModel {
    var username: String { get }
    var friendsCountDescription: String { get }
    
    func handleFollow()
}

class UserViewModelImpl: UserViewModel {
    // MARK: - Init
    init(userModel: UserModel) {
        self.userModel = userModel
    }
    
    // MARK: - Properties
    private let userModel: UserModel
    
    // MARK: - UserViewModel
    var username: String {
        return "\(userModel.name) \(userModel.surname)"
    }
    
    var friendsCountDescription: String {
        return "\(userModel.friendCount) friends"
    }
    
    func handleFollow() {
        print(#function)
    }
}
