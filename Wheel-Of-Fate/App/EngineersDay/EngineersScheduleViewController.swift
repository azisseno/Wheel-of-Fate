//
//  EngineersScheduleViewController.swift
//  Wheel-Of-Fate
//
//  Created by Azis Senoaji Prasetyotomo on 04/08/18.
//  Copyright © 2018 Azis Senoaji Prasetyotomo. All rights reserved.
//

import UIKit

class EngineersScheduleViewController: UITableViewController {

    let dataSource: EngineersScheduleDataSource = EngineersScheduleDataSource()
    lazy var viewModel: EngineersScheduleViewModel = EngineersScheduleViewModel(dataSource: dataSource)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }


    //MARK: - Initial Setup
    func setupNavBar() {
        title = "Generated Fate"
    }
    
    func setupTableView() {
        
        tableView.estimatedRowHeight = 65
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false
        tableView.dataSource = dataSource
    }
    
    func setupViewModel() {
        viewModel.generateFate()
        dataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.tableView.reloadData()
        }
    }
}
