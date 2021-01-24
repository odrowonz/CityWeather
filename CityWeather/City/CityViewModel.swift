//
//  CityViewModel.swift
//  CityWeather
//
//  Created by Andrey Antipov on 23.01.2021.
//

import Foundation

protocol ModelCityOutput {
    func onSelectParameter(city: inout City)
}

class CityViewModel: ViewOutput {
    // интерфейс CityViewModel -> CityModel
    private var model: ModelCityOutput = CityModel.shared
    
    lazy var onSelect: ((inout City) -> Void)? = { (city: inout City) in
        self.model.onSelectParameter(city: &city)
    }
}
