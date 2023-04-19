//
//  ColorsViewController.swift
//  MVVM
//
//  Created by Stanislav Lemeshaev on 24.01.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController {
    // MARK: - Properties
    private var tableView = UITableView()
    private let colorViewModel = ColorViewModelImpl()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Private
    private func configureUI() {
        tableView.register(UINib(nibName: ColorsTableViewCell.reuseId, bundle: nil), forCellReuseIdentifier: ColorsTableViewCell.reuseId)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        colorViewModel.handleViewReady()
        colorViewModel.itemsChanged = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource
extension ColorsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorViewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ColorsTableViewCell.reuseId, for: indexPath) as! ColorsTableViewCell
        cell.update(viewModel: colorViewModel.items[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ColorsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
}
