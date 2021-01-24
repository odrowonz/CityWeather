import UIKit
import PlaygroundSupport
 
PlaygroundPage.current.needsIndefiniteExecution = true

enum Condition: String {
    case clear = "clear" // "ясно"
    case partlyCloudy = "partly-cloudy" // "малооблачно"
    case cloudy = "cloudy" // "облачно с прояснениями"
    case overcast = "overcast" // "пасмурно"
    case drizzle = "drizzle" // "морось"
    case lightRain = "light-rain" // "небольшой дождь"
    case rain = "rain" // "дождь"
    case moderateRain = "moderate-rain" // "умеренно сильный дождь"
    case heavyRain = "heavy-rain" // "сильный дождь"
    case continuousHeavyRain = "continuous-heavy-rain" // "длительный сильный дождь"
    case showers = "showers" // "ливень"
    case wetSnow = "wet-snow" // "дождь со снегом"
    case lightSnow = "light-snow" // "небольшой снег"
    case snow = "snow" // "снег"
    case snowShowers = "snow-showers" // "снегопад"
    case hail = "hail" // "град"
    case thunderstorm = "thunderstorm" // "гроза"
    case thunderstormWithRain = "thunderstorm-with-rain" // "дождь с грозой"
    case thunderstormWithHail = "thunderstorm-with-hail" // "гроза с градом"
}

let conditionRU: [String: String] = [
    "clear": "ясно",
    "partly-cloudy": "малооблачно",
    "cloudy": "облачно с прояснениями",
    "overcast": "пасмурно",
    "drizzle": "морось",
    "light-rain": "небольшой дождь",
    "rain": "дождь",
    "moderate-rain": "умеренно сильный дождь",
    "heavy-rain": "сильный дождь",
    "continuous-heavy-rain": "длительный сильный дождь",
    "showers": "ливень",
    "wet-snow": "дождь со снегом",
    "light-snow": "небольшой снег",
    "snow": "снег",
    "snow-showers": "снегопад",
    "hail": "град",
    "thunderstorm": "гроза",
    "thunderstorm-with-rain": "дождь с грозой",
    "thunderstorm-with-hail": "гроза с градом"
]

func getClassName(obj : AnyObject) -> String
{
    let objectClass : AnyClass! = object_getClass(obj)
    let className = objectClass.description()

    return className
}

func sendRequest(_ url: String,
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

sendRequest("https://api.weather.yandex.ru/v2/forecast",
            method: "GET",
            parameters: ["lat": "55.75", "lon": "37.62"],
            headers: ["8816747c-6c5e-4dff-a92c-175de40338a3": "X-Yandex-API-Key"]) { responseObject, error in
    guard let responseObject = responseObject, error == nil else {
        print(error ?? "Unknown error")
        return
    }
    
    // температура и текущие погодные условия

    if let fact = responseObject["fact"] as? Dictionary<String, Any> {
        if let temp = fact["temp"] as? Int {
            print(temp)
        }
        
        if let condString = fact["condition"] as? String,
           let condType = Condition(rawValue: condString) {
            print(condString)
            print(condType)
        }
    }
}
