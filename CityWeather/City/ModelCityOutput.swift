//
//  File.swift
//  CityWeather
//
//  Created by Andrey Antipov on 24.01.2021.
//

import Foundation

protocol ModelCityOutput {
    func onSelectParameter(lat: Float, lon: Float, saving: @escaping (WhatToDoWithWeather)) 
}
