//
//  City.swift
//  CityWeather
//
//  Created by Andrey Antipov on 01.12.2020
//  Copyright © 2020 Andrey Antipov. All rights reserved..
//

import UIKit

/// Класс описывающий город
public final class City: Codable, Equatable {
    /// Название города
    let name: String
    /// Широта города
    let lat: Float
    /// Долгота города
    let lon: Float
    /// Изображение города
    let image: String
    
    init(name: String, lat: Float, lon: Float, image: String) {
        self.name = name
        self.lat = lat
        self.lon = lon
        self.image = image
    }
    
    public static func == (lhs: City, rhs: City) -> Bool {
        return lhs.name == rhs.name
    }
    
    public static func != (lhs: City, rhs: City) -> Bool {
        return lhs.name != rhs.name
    }
}