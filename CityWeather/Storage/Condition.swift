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
}
