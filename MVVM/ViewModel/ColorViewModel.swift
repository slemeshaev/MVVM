//
//  ColorViewModel.swift
//  MVVM
//
//  Created by Stanislav Lemeshaev on 09.04.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

protocol ListItemViewModel {
    var color: UIColor { get }
    var title: String { get }
    var subtitle: String { get }
    var subtitle2: String { get }
}

struct ListItemViewModelImpl: ListItemViewModel {
    var color: UIColor
    var title: String
    var subtitle: String
    var subtitle2: String
}

protocol ColorViewModel {
    var items: [ListItemViewModel] { get }
    var itemsChanged: (() -> ())? { get set }
    
    func handleViewReady()
}

class ColorViewModelImpl: ColorViewModel {
    private let model = ListModelImpl()
    
    var items: [ListItemViewModel] = []
    
    var itemsChanged: (() -> ())?
    
    func handleViewReady() {
        model.loadData { (result) in
            self.items = result.map({
                ListItemViewModelImpl(color: $0.color,
                                      title: $0.title,
                                      subtitle: $0.subtitle,
                                      subtitle2: $0.subtitle2)
            })
            self.itemsChanged?()
        }
    }
}
