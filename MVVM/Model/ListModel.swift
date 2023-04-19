//
//  ListModel.swift
//  MVVM
//
//  Created by Stanislav Lemeshaev on 27.01.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

protocol ListModel {
    func loadData(completed: @escaping (([ListObject]) -> ()))
}

class ListModelImpl: ListModel {
    func loadData(completed: @escaping (([ListObject]) -> ())) {
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.2) {
            completed(self.generateData())
        }
    }
    
    func generateData() -> [ListObject] {
        let colors: [UIColor] = [.red, .blue, .green, .black, .gray, .yellow, .purple, .orange]
        var result: [ListObject] = []
        
        for i in 0..<colors.count {
            result.append(ListObject(color: colors[i],
                                     title: "Title\(i)",
                                     subtitle: "Subtitle1\(i)",
                                     subtitle2: "Subtitle2\(i)"))
        }
        
        return result
    }
}
