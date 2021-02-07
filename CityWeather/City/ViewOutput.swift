//
//  ViewOutput.swift
//  CityWeather
//
//  Created by Andrey Antipov on 24.01.2021.
//

import Foundation

protocol ViewOutput {
    var onSelect: ((Float, Float, @escaping (WhatToDoWithWeather)) -> Void)? { get set }
    func getWeather(whatToDoWithCity: @escaping (WhatToDoWithCity), whatToDoAtTheEnd: @escaping (()->Void))
    func filterContent(for searchText: String, whatToDoAtTheEnd: @escaping (WhatToDoWithCities))
}
