//
//  MenuOption.swift
//  TWOSOMEHEART-iOS
//
//  Created by RAFA on 11/20/24.
//

import Foundation

struct MenuOption {

    let section: Int
    let options: [String]
}

// MARK: - Mock Data

extension MenuOption {

    static let menuOptions: [MenuOption] = [
        MenuOption(section: 0, options: ["샷추가"]),
        MenuOption(section: 1, options: ["바닐라시럽", "헤이즐넛시럽", "카라멜시럽"]),
        MenuOption(section: 2, options: ["휘핑크림"]),
        MenuOption(section: 3, options: ["카라멜드리즐", "초콜릿드리즐"])
    ]
}
