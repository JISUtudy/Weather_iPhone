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
        tv.backgroundColor = .clear
        return tv
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        
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
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(24)
        }
        // Cell 등록
        weatherTableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.identifier)
        // tableView 경계선 없애기
        weatherTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        // 스크롤 인디케이터 없애기
        weatherTableView.showsVerticalScrollIndicator = false
        // tableView 높이 설정
        weatherTableView.rowHeight = 130
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as! WeatherTableViewCell
    
        cell.contentView.backgroundColor = .darkGray
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        
        cell.myLocationLabel.text = "나의 위치"
        cell.myCurrentLocationLabel.text = "계양구"
        cell.weatherLabel.text = "한때 흐림"
        cell.temperatureLabel.text = "17º"
        cell.highestTemperatureLabel.text = "최고:17º"
        cell.lowestTemperatureLabel.text = "최저:13º"

        return cell
    }
    
    
}
