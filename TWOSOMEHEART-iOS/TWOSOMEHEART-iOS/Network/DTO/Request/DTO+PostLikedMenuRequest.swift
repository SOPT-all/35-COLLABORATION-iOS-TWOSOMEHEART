//
//  DTO+PostLikedMenuRequest.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/26/24.
//

import Foundation

extension DTO {
    
    struct PostLikedMenuRequest: Codable {
        let menuId: Int
        let likedMenuInfo: LikedMenuInfo
    }
    
}

extension DTO.PostLikedMenuRequest {
    
    struct LikedMenuInfo: Codable {
        let name: String
        let price: Int
        let temperature: Int
        let size: Int
        let coffeeBean: Int
        let togo: Int
        let personal: Bool?
    }
    
}
