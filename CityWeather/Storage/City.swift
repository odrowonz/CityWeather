//
//  City.swift
//  CityWeather
//
//  Created by Andrey Antipov on 01.12.2020
//  Copyright © 2020 Andrey Antipov. All rights reserved..
//

import UIKit

/// Класс описывающий город
struct City {
    /// Название города (английский)
    let nameEN: String
    /// Название города
    let nameRU: String
    /// Широта города
    let lat: Float
    /// Долгота города
    let lon: Float
    /// Изображение города
    let image: String
    /// Температура
    var temp: Int?
    /// Погодные условия
    var condition: Condition?
    
    init(nameEN: String, nameRU: String, lat: Float, lon: Float, image: String) {
        self.nameEN = nameEN
        self.nameRU = nameRU
        self.lat = lat
        self.lon = lon
        self.image = image
    }
    
    public static func == (lhs: City, rhs: City) -> Bool {
        return lhs.nameEN == rhs.nameEN
    }
    
    public static func != (lhs: City, rhs: City) -> Bool {
        return lhs.nameEN != rhs.nameEN
    }
}
