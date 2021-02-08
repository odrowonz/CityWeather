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
    
    var allCities: [City] = AllCities.list

    var onSelect: ((Float, Float, @escaping (WhatToDoWithWeather)) -> Void)? = {
        (lat, lon, whatToDo) -> Void in
        CityViewModel.model.onSelectParameter(lat: lat, lon: lon, saving: whatToDo)
    }
    
    func getWeather(whatToDoWithCity: @escaping (WhatToDoWithCity), whatToDoAtTheEnd: @escaping (()->Void)) {
        _ = allCities.map({
            if let method = self.onSelect,
               allCities.count > 0 {
                let cityName = $0.nameEN
                method($0.lat, $0.lon) {
                    (temp, condition) in
                    if let index = self.allCities.firstIndex(where: { $0.nameEN == cityName}) {
                        self.allCities[index].temp = temp
                        self.allCities[index].condition = condition
                        whatToDoWithCity(self.allCities[index])
                        //whatToDoAtTheEnd()
                    }
                }
            }
        })
    }
    
    func filterContent(for searchText: String, whatToDoAtTheEnd: @escaping (WhatToDoWithCities)) {
        let filteredCities = Array(allCities.filter({ (city) -> Bool in
                    return searchText == "" ? true : city.nameEN.localizedCaseInsensitiveContains(searchText)
                }).prefix(10))
        
        whatToDoAtTheEnd(filteredCities)
    }
}
