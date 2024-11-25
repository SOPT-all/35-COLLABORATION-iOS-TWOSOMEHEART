//
//  DTO+GetMenuInfoResponse.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/26/24.
//

import Foundation

extension DTO {
    
    struct GetMenuInfoResponse: Codable {
        let code: Int
        let data: MenuInfo
    }
    
}

extension DTO.GetMenuInfoResponse {
    
    struct MenuInfo: Codable {
        let id: Int
        let name: String
        let status: String
        let description: String
        let price: Int
        let caution: String?
        let nutrition: String
        let allergy: String?
        let image_url: String
    }
    
}
