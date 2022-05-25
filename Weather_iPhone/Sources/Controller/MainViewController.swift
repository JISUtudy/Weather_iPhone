//
//  ViewController.swift
//  Weather_iPhone
//
//  Created by 이지석 on 2022/05/18.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var weatherTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .darkGray
        return tv
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        configureNav()
        configureUI()
    }
    
    
    // MARK: - Selector
    
    @objc func handleMenu() {
        print("DEBUG: Nav Right button tapped")
    }


    // MARK: - Functions
    
    private func configureUI() {
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        
        view.addSubview(weatherTableView)
        
        weatherTableView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.leading.trailing.equalToSuperview().inset(24)
        }
    }
    
    private func configureNav() {
        
        navigationItem.title = "날씨"

        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .white
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "도시 또는 공항 검색"
        searchController.obscuresBackgroundDuringPresentation = true
        self.navigationItem.searchController = searchController
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: #selector(handleMenu))
    }
    
}



// MARK: UITableViewDelegate

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    
}
