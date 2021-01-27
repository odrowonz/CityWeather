//
//  ViewOutput.swift
//  CityWeather
//
//  Created by Andrey Antipov on 24.01.2021.
//

import Foundation

protocol ViewOutput {
    var onSelect: ((City, @escaping (whatToDoWithCityWeather)) -> Void)? { get set }
}
