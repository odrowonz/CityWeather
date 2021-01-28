//
//  Condition.swift
//  CityWeather
//
//  Created by Andrey Antipov on 24.01.2021.
//

import Foundation

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
    
    func getTextRU() -> String {
        switch self {
        case .clear: return "ясно"
        case .partlyCloudy: return "малооблачно"
        case .cloudy: return "облачно с прояснениями"
        case .overcast: return "пасмурно"
        case .drizzle: return "морось"
        case .lightRain: return "небольшой дождь"
        case .rain: return "дождь"
        case .moderateRain: return "умеренно сильный дождь"
        case .heavyRain: return "сильный дождь"
        case .continuousHeavyRain: return "длительный сильный дождь"
        case .showers: return "ливень"
        case .wetSnow: return "дождь со снегом"
        case .lightSnow: return "небольшой снег"
        case .snow: return "снег"
        case .snowShowers: return "снегопад"
        case .hail: return "град"
        case .thunderstorm: return "гроза"
        case .thunderstormWithRain: return "дождь с грозой"
        case .thunderstormWithHail: return "гроза с градом"
        }
    }
}
