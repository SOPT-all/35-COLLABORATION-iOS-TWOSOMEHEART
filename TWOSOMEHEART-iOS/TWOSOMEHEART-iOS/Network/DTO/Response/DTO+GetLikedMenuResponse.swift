//
//  DTO+GetLikedMenuResponse.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/26/24.
//

import Foundation

extension DTO {
    
    struct GetLikedMenuResponse: Codable {
        let code: Int
        let data: [FavoriteList]?
    }
    
}

extension DTO.GetLikedMenuResponse {
    
    struct FavoriteList: Codable {
        let id: Int
        let name: String
        let price: Int
        let imageURL: String
        let temperature: Int
        let size: Int
        let coffeeBean: Int
        let togo: Int
        let personal: Bool?
        
        private enum CodingKeys: String, CodingKey {
            case id
            case name
            case price
            case imageURL = "image_url"
            case temperature
            case size
            case coffeeBean
            case togo
            case personal
        }
    }
    
}
