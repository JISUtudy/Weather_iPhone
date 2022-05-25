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
    
    var myLocationLabel = UILabel()
    var myCurrentLocationLabel = UILabel()
    var weatherLabel = UILabel()
    var temperatureLabel = UILabel()
    var highestTemperatureLabel = UILabel()
    var lowestTemperatureLabel = UILabel()

    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addContentView()
        autoLayout()
        labelStyle()
    }
    
    // Inside UITableViewCell subclass
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentView.clipsToBounds = true
        self.contentView.layer.cornerRadius = 20
        
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
    
    private func labelStyle() {
        myLocationLabel.font = UIFont.boldSystemFont(ofSize: 23)
        myLocationLabel.textColor = .white
        myCurrentLocationLabel.font = UIFont.boldSystemFont(ofSize: 15)
        myCurrentLocationLabel.textColor = .white
        weatherLabel.font = UIFont.boldSystemFont(ofSize: 15)
        weatherLabel.textColor = .white
        temperatureLabel.font = UIFont.systemFont(ofSize: 40)
        temperatureLabel.textColor = .white
        highestTemperatureLabel.font = UIFont.boldSystemFont(ofSize: 15)
        highestTemperatureLabel.textColor = .white
        lowestTemperatureLabel.font = UIFont.boldSystemFont(ofSize: 15)
        lowestTemperatureLabel.textColor = .white   
    }
}
