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
        let image_url: String
        let temperature: Int
        let size: Int
        let coffeeBean: Int
        let togo: Int
        let personal: Bool?
    }
    
}
