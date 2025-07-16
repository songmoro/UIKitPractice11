//
//  City.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/16/25.
//

struct City {
    let city_name: String
    let city_english_name: String
    let city_explain: String
    let city_image: String
    let domestic_travel: Bool
    
    let lowerCasedCityEnglishName: String
    
    init(city_name: String, city_english_name: String, city_explain: String, city_image: String, domestic_travel: Bool) {
        self.city_name = city_name
        self.city_english_name = city_english_name
        self.city_explain = city_explain
        self.city_image = city_image
        self.domestic_travel = domestic_travel
        
        self.lowerCasedCityEnglishName = city_english_name.lowercased()
    }
}
