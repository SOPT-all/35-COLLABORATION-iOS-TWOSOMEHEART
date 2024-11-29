//
//  DTO+DeleteLikedMenuResponse.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/26/24.
//

import Foundation

extension DTO {
    
    struct DeleteLikedMenuResponse: Codable {
        let code: Int
        let data: String? // nil만 반환 예상
    }
    
}
