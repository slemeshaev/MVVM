//
//  ColorsTableViewCell.swift
//  MVVM
//
//  Created by Stanislav Lemeshaev on 09.04.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

class ColorsTableViewCell: UITableViewCell {
    
    static let reuseId = "ColorsTableViewCell"
    
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var subtitle2Label: UILabel!
    
    // MARK: - Interface
    func update(viewModel: ListItemViewModel) {
        avatarImageView.backgroundColor = viewModel.color
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        subtitle2Label.text = viewModel.subtitle2
    }
}
