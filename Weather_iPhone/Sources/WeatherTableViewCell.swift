//
//  WeatherTableViewCell.swift
//  Weather_iPhone
//
//  Created by 김수정 on 2022/05/25.
//

import UIKit
import SnapKit

class WeatherTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "WeatherTableViewCell"
    
    lazy var myLocationLabel: UILabel = {
        var label = UILabel()
        label.setFontColor(text: "나의 위치", font: .boldSystemFont(ofSize: 23), color: .white)
        return label
    }()
    
    lazy var myCurrentLocationLabel: UILabel = {
        var label = UILabel()
        label.setFontColor(text: "계양구", font: .boldSystemFont(ofSize: 15), color: .white)
        return label
    }()
    
    lazy var weatherLabel: UILabel = {
        var label = UILabel()
        label.setFontColor(text: "한때 흐림", font: .boldSystemFont(ofSize: 15), color: .white)
        return label
    }()
    
    lazy var temperatureLabel: UILabel = {
        var label = UILabel()
        label.setFontColor(text: "17º", font: .boldSystemFont(ofSize: 40), color: .white)
        return label
    }()
    
    lazy var highestTemperatureLabel: UILabel = {
        var label = UILabel()
        label.setFontColor(text: "최고:17º", font: .boldSystemFont(ofSize: 15), color: .white)
        return label
    }()
    
    lazy var lowestTemperatureLabel: UILabel = {
        var label = UILabel()
        label.setFontColor(text: "최저:13º", font: .boldSystemFont(ofSize: 15), color: .white)
        return label
    }()

    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addContentView()
        autoLayout()
    }
    
    // Inside UITableViewCell subclass
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentView.clipsToBounds = true
        self.contentView.layer.cornerRadius = 20
        self.contentView.backgroundColor = .darkGray
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func addContentView() {
        contentView.addSubview(myLocationLabel)
        contentView.addSubview(myCurrentLocationLabel)
        contentView.addSubview(weatherLabel)
        contentView.addSubview(temperatureLabel)
        contentView.addSubview(highestTemperatureLabel)
        contentView.addSubview(lowestTemperatureLabel)
    }
    
    private func autoLayout() {
        myLocationLabel.snp.makeConstraints {
            $0.leading.top.equalTo(20)
        }
        myCurrentLocationLabel.snp.makeConstraints {
            $0.top.equalTo(myLocationLabel.snp.bottom).offset(2)
            $0.leading.equalTo(myLocationLabel.snp.leading)
        }
        weatherLabel.snp.makeConstraints {
            $0.bottom.equalTo(-20)
            $0.leading.equalTo(myCurrentLocationLabel.snp.leading)
        }
        temperatureLabel.snp.makeConstraints {
            $0.top.equalTo(myLocationLabel.snp.top)
            $0.trailing.equalTo(-20)
        }
        lowestTemperatureLabel.snp.makeConstraints {
            $0.bottom.equalTo(-20)
            $0.trailing.equalTo(temperatureLabel.snp.trailing)
        }
        highestTemperatureLabel.snp.makeConstraints {
            $0.right.equalTo(lowestTemperatureLabel.snp.left).offset(-5)
            $0.bottom.equalTo(lowestTemperatureLabel.snp.bottom)
        }
    }
}
