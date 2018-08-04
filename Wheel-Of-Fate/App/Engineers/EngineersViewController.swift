//
//  ViewController.swift
//  Wheel-Of-Fate
//
//  Created by Azis Senoaji Prasetyotomo on 03/08/18.
//  Copyright © 2018 Azis Senoaji Prasetyotomo. All rights reserved.
//

import UIKit
import api

class EngineersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomButton: UIButton!
    
    let dataSource: EngineersDataSource = EngineersDataSource()
    lazy var viewModel: EngineersViewModel = EngineersViewModel(dataSource: dataSource)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBottomButton()
        setupTableView()
        setupViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    
    //MARK: - Initial Setup
    func setupNavBar() {
        title = "Available Engineers"
    }
    
    func setupBottomButton() {
        bottomButton.backgroundColor = .green
        bottomButton.tintColor = .black
        bottomButton.setTitle("Generate Schedule", for: .normal)
    }
    
    func setupTableView() {
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self,
                                  action: #selector(handleRefresh(_:)),
                                  for: .valueChanged)
        tableView.refreshControl?.tintColor = .darkGray

        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
        
        tableView.dataSource = dataSource
    }
    
    func setupViewModel() {
        viewModel.load()
        dataSource.requestState.addAndNotify(observer: self) { [weak self] in
            self?.bindRequestState()
        }
    }
    
    func bindRequestState() {
        switch dataSource.requestState.value {
        case .loading(_ ):
            tableView.refreshControl?.beginRefreshing()
        case .success:
            tableView.refreshControl?.endRefreshing()
            tableView.reloadData()
        default:
            tableView.reloadData()
        }
    }
    
    @objc func handleRefresh(_ rc: UIRefreshControl) {
        viewModel.load(fetchForce: true)
    }

}

