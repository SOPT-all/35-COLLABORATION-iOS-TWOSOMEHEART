//
//  DTO+PostLikedMenuResponse.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/26/24.
//

import Foundation

extension DTO {
    
    struct PostLikedMenuResponse: Codable {
        let code: Int
        let data: String? // nil만 반환 예상
    }
    
}
