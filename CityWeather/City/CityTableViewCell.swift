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
            cityName.text = city?.name
        }
    }
    
    lazy var cityName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
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
        
        cityName.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(contentView).inset(UIEdgeInsets(top: 10, left: 15, bottom: 10, right: -15))
        }
    }

}
