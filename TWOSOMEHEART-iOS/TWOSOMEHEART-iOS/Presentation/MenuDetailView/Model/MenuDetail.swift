//
//  MenuDetail.swift
//  TWOSOMEHEART-iOS
//
//  Created by 김예지 on 11/21/24.
//

import Foundation

import UIKit

struct MenuDetail {
    let id: Int
    let name: String
    let status: MenuStatusType
    let description: String
    let price: Int
    let caution: [CautionType]
    let nutrition: String
    let allergy: String
    let imageURL: UIImage // TODO: 나중에 명세서에 맞게 string으로 변경
}

extension MenuDetail {
    static let menuItems: [MenuDetail] = [
        MenuDetail(
            id : 1,
            name:"바나나 샷 라떼",
            status: .new,
            description: "달콤한 바나나 라떼에 에스프레소 샷 추가!",
            price: 5500,
            caution: [.highCaffeine, .milk],
            nutrition: "1회 제공량: 325ml\n총 제공량: 1잔\n열량(Kcal): 260\n당류(g/%): 30/30\n단백질(g/%): 7/13\n포화지방(g/%): 5/33\n나트륨(mg/%): 160/8\n카페인(mg/%): 92",
            allergy: "우유",
            imageURL: UIImage(resource: .imgMymenu1)
        )
    ]
}
