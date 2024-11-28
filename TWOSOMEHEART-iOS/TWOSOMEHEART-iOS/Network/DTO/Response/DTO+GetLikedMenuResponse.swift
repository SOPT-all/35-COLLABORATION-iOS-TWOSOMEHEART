//
//  DTO+GetLikedMenuResponse.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/26/24.
//

import Foundation

extension DTO {
    
    struct GetLikedMenuResponse: Codable {
        let status: Int
        let data: GetLikedMenuData?
    }
    
    struct GetLikedMenuData: Codable {
        let favoriteList: [DTO.GetLikedMenuResponse.FavoriteList]
    }
}

extension DTO.GetLikedMenuResponse {
    
    struct FavoriteList: Codable {
        let id: Int
        let name: String
        let price: Int
        let imageUrl: String
        let temperature: String
        let size: String
        let coffeeBean: String
        let togo: String
        let personal: Bool?
        
        private enum CodingKeys: String, CodingKey {
            case id
            case name
            case price
            case imageUrl = "imageUrl"
            case temperature
            case size
            case coffeeBean
            case togo
            case personal
        }
        
        var formattedOptions: String {
            let personalCup = personal == true ? "개인컵" : "일회용컵"
            return "\(temperature)/\(size)/\(coffeeBean)/\(togo)/\(personalCup)"
        }
    }
    
}
