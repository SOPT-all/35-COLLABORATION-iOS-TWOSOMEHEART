//
//  MenuOptionHeader.swift
//  TWOSOMEHEART-iOS
//
//  Created by RAFA on 11/20/24.
//

import UIKit

struct MenuOptionHeader {

    let title: String
    let arrowImage: UIImage
    var price: Int = 0
    var itemPrices: [Int] = []
    var isExpanded: Bool
    var addedOptions: String?
}
