//
//  ViewOutput.swift
//  CityWeather
//
//  Created by Andrey Antipov on 24.01.2021.
//

import Foundation

protocol ViewOutput {
    var onSelect: ((Float, Float, @escaping (WhatToDoWithWeather)) -> Void)? { get set }
}
