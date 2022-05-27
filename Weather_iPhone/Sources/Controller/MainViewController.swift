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
        tv.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.identifier)
        tv.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        tv.showsVerticalScrollIndicator = false
        tv.rowHeight = 130
        return tv
    }()
    
    lazy var footerView: UIView = {
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 130))
        weatherTableView.tableFooterView = footer
        return footer
    }()
    
    lazy var footerWeatherDataBtn: UIButton = {
        let ftWeatherDataBtn = UIButton(frame: footerView.bounds)
        ftWeatherDataBtn.setBtnFontColor(text: "날씨 데이터", font: .systemFont(ofSize: 12), color: .white)
        ftWeatherDataBtn.setUnderline()
        ftWeatherDataBtn.addTarget(self, action: #selector(weatherData), for: .touchUpInside)
        footerView.addSubview(ftWeatherDataBtn)
        return ftWeatherDataBtn
    }()
    
    lazy var footerFirstLabelBtn: UIButton = {
        let ftFirstLabelBtn = UIButton(frame: footerView.bounds)
        ftFirstLabelBtn.setBtnFontColor(text: "및", font: .systemFont(ofSize: 12), color: .white)
        footerView.addSubview(ftFirstLabelBtn)
        return ftFirstLabelBtn
    }()
    
    lazy var footerMapDataBtn: UIButton = {
        let ftMapDataBtn = UIButton(frame: footerView.bounds)
        ftMapDataBtn.setBtnFontColor(text: "지도 데이터", font: .systemFont(ofSize: 12), color: .white)
        ftMapDataBtn.setUnderline()
        ftMapDataBtn.addTarget(self, action: #selector(mapData), for: .touchUpInside)
        footerView.addSubview(ftMapDataBtn)
        return ftMapDataBtn
    }()
    
    lazy var footerLastLabelBtn: UIButton = {
        let ftLastLabelBtn = UIButton(frame: footerView.bounds)
        ftLastLabelBtn.setBtnFontColor(text: "에 관하여 더 알아보기", font: .systemFont(ofSize: 12), color: .white)
        footerView.addSubview(ftLastLabelBtn)
        return ftLastLabelBtn
    }()
    
    lazy var footerImageBtn: UIButton = {
        let ftImageBtn = UIButton(frame: footerView.bounds)
        ftImageBtn.setImage(UIImage(named: "weather_icon"), for: .normal)
        ftImageBtn.addTarget(self, action: #selector(weatherImage), for: .touchUpInside)
        footerView.addSubview(ftImageBtn)
        return ftImageBtn
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        
        configureNav()
        configureUI()
        autoLayout()
    }
    
    // MARK: - Selector
    
    @objc func handleMenu() {
        print("DEBUG: Nav Right button tapped")
    }
    @objc func weatherData() {
        print("DEBUG: WeatehrData button tapped")
    }
    @objc func mapData() {
        print("DEBUG: MapData button tapped")
    }
    @objc func weatherImage() {
        print("DEBUG: WeatehrImage button tapped")
    }
    
    // MARK: - Functions
    
    private func configureUI() {
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        
        view.addSubview(weatherTableView)
        
        weatherTableView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(24)
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
    
    private func autoLayout() {
        footerWeatherDataBtn.snp.makeConstraints {
            $0.top.equalTo(footerView.snp.top)
            $0.leading.equalTo(footerView.snp.leading).offset(70)
        }
        footerFirstLabelBtn.snp.makeConstraints {
            $0.left.equalTo(footerWeatherDataBtn.snp.right).offset(-5)
            $0.top.equalTo(footerWeatherDataBtn.snp.top)
        }
        footerMapDataBtn.snp.makeConstraints {
            $0.left.equalTo(footerFirstLabelBtn.snp.right).offset(-5)
            $0.top.equalTo(footerWeatherDataBtn.snp.top)
        }
        footerLastLabelBtn.snp.makeConstraints {
            $0.left.equalTo(footerMapDataBtn.snp.right)
            $0.top.equalTo(footerWeatherDataBtn.snp.top)
        }
        footerImageBtn.snp.makeConstraints {
            $0.top.equalTo(footerWeatherDataBtn.snp.top).offset(35)
            $0.size.equalTo(CGSize(width: 30, height: 30))
            $0.centerX.equalTo(footerView.snp.centerX)
        }
    }
}

// MARK: UITableViewDelegate

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as! WeatherTableViewCell
        
        return cell
    }
    
    
}
