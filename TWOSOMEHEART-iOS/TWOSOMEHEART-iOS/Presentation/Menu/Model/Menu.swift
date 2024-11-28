//
//  Menu.swift
//  TWOSOMEHEART-iOS
//
//  Created by RAFA on 11/28/24.
//

import UIKit

enum MenuStatus {
    case new, best
}

struct Menu {
    let menuImage: UIImage
    let menuStatus: MenuStatus
    let menuTitle: String
    let menuPrice: Int
}

extension Menu {

    static let sample: [Menu] = [
        Menu(
            menuImage: .imgList2,
            menuStatus: .new,
            menuTitle: "바나나 샷 라떼",
            menuPrice: 5500
        ),
        Menu(
            menuImage: .imgList1,
            menuStatus: .new,
            menuTitle: "바나나 샷 아메리카노",
            menuPrice: 5800
        ),
        Menu(
            menuImage: .imgList4,
            menuStatus: .best,
            menuTitle: "디카페인 오틀리 콜드브루",
            menuPrice: 6300
        ),
        Menu(
            menuImage: .imgList3,
            menuStatus: .best,
            menuTitle: "레몬 아샷추",
            menuPrice: 5500
        )
    ]
}
