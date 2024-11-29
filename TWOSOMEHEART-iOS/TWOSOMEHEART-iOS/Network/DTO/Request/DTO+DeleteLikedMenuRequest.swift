//
//  DTO+DeleteLikedMenuRequest.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/26/24.
//

import Foundation

extension DTO {
    
    struct DeleteLikedMenuRequest: Codable {
        let favoriteIds: String
        let all: String
    }
    
}
