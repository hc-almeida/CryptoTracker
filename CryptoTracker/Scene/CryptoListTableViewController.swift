//
//  CryptoListTableViewController.swift
//  CryptoTracker
//
//  Created by Hellen on 04/11/21.
//

import UIKit

final class CryptoListTableViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.register(CryptoTableViewCell.self, forCellReuseIdentifier: CryptoTableViewCell.identifier)
        
        tableView.backgroundView = stateDescriptionLabel
        return tableView
    }()
    
    private let stateDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .systemGray
        label.text = "Loading Cryptos.."
        return label
    }()
    
    private let viewModel = CryptoListViewModel()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupViewModel()
    }
    
    func setupViewModel() {
        viewModel.stateChanged = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.stateDescriptionLabel.text = self.viewModel.stateDescription
            }
        }
        viewModel.loadCryptos()
    }
}

// MARK: - UITableViewDelegate and UITableViewDataSource

extension CryptoListTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTableViewCell.identifier, for: indexPath)
                as? CryptoTableViewCell else { return UITableViewCell() }
        
        let model = viewModel.modelForRow(at: indexPath.row)
        cell.configure(with: model)
        
        return cell
    }
}

// MARK: - UViewCodeProtocol

extension CryptoListTableViewController: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    
    func addConstraints() {
        tableView.fillSuperview()
    }
    
    func additionalConfiguration() {
        title = "Crypto Tracker"
    }
}
