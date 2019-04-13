//
//  de.swift
//  WeatherToday
//
//  Created by 임성주 on 11/04/2019.
//  Copyright © 2019 jangre. All rights reserved.
//

import Foundation
/*
 {
 "city_name":"베를린",
 "state":12,
 "celsius":10.8,
 "rainfall_probability":60
 }
*/

struct Cities: Codable {
    let cityName: String
    let state: Int
    let celsius: Float
    let rainfallProbability: Int
    
    var stateToEnglish: String {
        switch self.state {
        case 10:
            return "sunny"
        case 11:
            return "cloudy"
        case 12:
            return "rainy"
        case 13:
            return "snowy"
        default:
            return ""
        }
    }
    
    var stateToKorean: String {
        switch self.state {
        case 10:
            return "맑음"
        case 11:
            return "흐림"
        case 12:
            return "비"
        case 13:
            return "눈"
        default:
            return ""
        }
    }
    
    var celsiusToString: String {
        return "섭씨 \(self.celsius)도 / 화씨 \((((self.celsius * 9/5) * 10).rounded() / 10) + 32)도"
    }
    
    var rainfallProbabilityToString: String {
        return "강수확률 \(self.rainfallProbability)%"
    }
    
    enum CodingKeys: String, CodingKey {
        case state, celsius
        case cityName = "city_name"
        case rainfallProbability = "rainfall_probability"
    }
}
