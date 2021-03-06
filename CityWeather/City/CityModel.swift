//
//  CityModel.swift
//  CityWeather
//
//  Created by Andrey Antipov on 20.01.2021.
//

import Foundation

class CityModel: ModelCityOutput {
    static let baseUrl = "https://api.weather.yandex.ru/v2/forecast"
    static let auth = ["f93c0971-a578-457a-90b3-19e758fd0215": "X-Yandex-API-Key"]
    
    static var shared: CityModel = {
            let instance = CityModel()
            return instance
        }()
    
    private init() {}
    
    func onSelectParameter(lat: Float, lon: Float, saving: @escaping (WhatToDoWithWeather))  {
        sendRequest(CityModel.baseUrl,
                    method: "GET",
                    parameters: ["lat": String(format: "%.2f", lat),
                                 "lon": String(format: "%.2f", lon),
                                 "lang": "en_US"],
                    headers: CityModel.auth) {
            responseObject, error in
            if (error == nil) {
                // temperature and current weather conditions
                if let responseObject = responseObject,
                   let fact = responseObject["fact"] as? Dictionary<String, Any>,
                   let tempVal = fact["temp"] as? Int,
                   let condString = fact["condition"] as? String,
                   let condVal = Condition(rawValue: condString) {
                    saving(tempVal, condVal)
                }
            }
        }
    }
        
    private func sendRequest(_ url: String,
                     method: String,
                     parameters: [String: String],
                     headers: [String: String],
                     completion: @escaping ([String: Any]?, Error?) -> Void) {
        var components = URLComponents(string: url)!
        components.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        var request = URLRequest(url: components.url!)
        request.httpMethod = method
        
        for (value, header) in headers {
            request.setValue(value, forHTTPHeaderField: header)
        }
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data,                            // is there data
                let response = response as? HTTPURLResponse,  // is there HTTP response
                (200 ..< 300) ~= response.statusCode,         // is statusCode 2XX
                error == nil else {                           // was there no error, otherwise ...
                completion(nil, error)
                return
            }

            let responseObject = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any]
            completion(responseObject, nil)
        }
        task.resume()
    }

    
}

extension CityModel: NSCopying {

    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}
