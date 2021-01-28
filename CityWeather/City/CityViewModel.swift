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

    var onSelect: ((Float, Float, @escaping (WhatToDoWithWeather)) -> Void)? = {
        (lat, lon, whatToDo) -> Void in
        CityViewModel.model.onSelectParameter(lat: lat, lon: lon, saving: whatToDo)
    }
}
