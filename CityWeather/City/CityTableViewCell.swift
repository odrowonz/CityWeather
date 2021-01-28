//
//  CityTableViewCell.swift
//  CityWeather
//
//  Created by Andrey Antipov on 06.12.2020.
//  Copyright © 2020 Andrey Antipov. All rights reserved.
//

import UIKit
import SnapKit

class CityTableViewCell: UITableViewCell {

    public var city: City? {
        didSet {
            if let city = city {
                cityName.text = city.name
                
                if let cond = city.condition {
                    cityCond.text = cond.getTextRU()
                } else {
                    cityCond.text = ""
                }
                
                if let temp = city.temp {
                    if temp > 0 {
                        cityTemp.text = "+" + String(temp) + "°C"
                    } else if temp < 0 {
                        cityTemp.text = String(temp) + "°C"
                    } else { cityTemp.text = "0°C" }
                } else {
                    cityTemp.text = ""
                }
            }
        }
    }
    
    lazy var cityName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    lazy var cityTemp: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .right
        return label
    }()
    
    lazy var cityCond: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    //override func awakeFromNib() {
    //    super.awakeFromNib()
        // Initialization code
    //}
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //override func setSelected(_ selected: Bool, animated: Bool) {
    //    super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    //}
    
    // MARK: Autolayout
    func setupLayout() {
        addSubview(cityName)
        addSubview(cityCond)
        addSubview(cityTemp)

        cityName.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalTo(cityTemp.snp.leading).offset(5)
            //make.edges.equalTo(contentView).inset(UIEdgeInsets(top: 10, left: 15, bottom: 10, right: -15))
        }
        
        cityCond.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(cityName.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            //make.trailing.equalTo(cityTemp.snp.leading).offset(5)
            //make.bottom.equalTo(contentView.snp.bottom).offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        cityTemp.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(10)
            make.left.equalTo(cityName.snp.right).offset(10)
            make.left.equalTo(cityCond.snp.right).offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }
        
    }

}
