//
//  CityViewModel.swift
//  CityWeather
//
//  Created by Andrey Antipov on 23.01.2021.
//

import Foundation

class CityViewModel: ViewOutput {
    // интерфейс CityViewModel -> CityModel
    static var model: ModelCityOutput = CityModel.shared

    var onSelect: ((City, @escaping (whatToDoWithCityWeather)) -> Void)? = {
        (city, whatToDo) -> Void in
        CityViewModel.model.onSelectParameter(city: city, saving: whatToDo)
    }
}
