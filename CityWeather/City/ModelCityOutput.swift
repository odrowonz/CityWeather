//
//  File.swift
//  CityWeather
//
//  Created by Andrey Antipov on 24.01.2021.
//

import Foundation

protocol ModelCityOutput {
    func onSelectParameter(city: City, saving: @escaping (whatToDoWithCityWeather)) 
}
