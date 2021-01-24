//
//  CityModel.swift
//  CityWeather
//
//  Created by Andrey Antipov on 20.01.2021.
//

import Foundation

class CityModel: ModelCityOutput {
    static let baseUrl = "https://api.weather.yandex.ru/v2/forecast"
    static let auth = ["8816747c-6c5e-4dff-a92c-175de40338a3": "X-Yandex-API-Key"]
    
    static var shared: CityModel = {
            let instance = CityModel()
            return instance
        }()
    
    private init() {}
    
    func onSelectParameter(city: inout City) {
        sendRequest(CityModel.baseUrl,
                    method: "GET",
                    parameters: ["lat": String(format: "%.2f", city.lat),
                                 "lon": String(format: "%.2f", city.lon)],
                    headers: CityModel.auth) { responseObject, error in
            guard let responseObject = responseObject, error == nil else {
                print(error ?? "Unknown error")
                return
            }
            
            // temperature and current weather conditions
            if let fact = responseObject["fact"] as? Dictionary<String, Any> {
                city.temp = fact["temp"] as? Int
                
                if let condString = fact["condition"] as? String {
                    city.condition = Condition(rawValue: condString)
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
