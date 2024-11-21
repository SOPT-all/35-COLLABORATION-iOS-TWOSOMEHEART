//
//  MyMenuItem.swift
//  TWOSOMEHEART-iOS
//
//  Created by 김예지 on 11/17/24.
//

import Foundation
import UIKit

struct MyMenuItem {
    let menuImage: UIImage
    let name: String
    let price: Int
    let options: [String]
}

extension MyMenuItem {
    static let myMenuItems: [MyMenuItem] = [
        MyMenuItem(
            menuImage: UIImage(resource: .imgMymenu1),
            name: "바나나샷 아메리카노",
            price: 5800,
            options: ["아이스", "라지", "블랙그라운드", "일회용컵"]
        ),
        MyMenuItem(
            menuImage: UIImage(resource: .imgMymenu2),
            name: "디카페인 오트밀 콜드브루",
            price: 6300,
            options: ["아이스", "라지", "블랙그라운드", "일회용컵"]
        )
    ]
}
