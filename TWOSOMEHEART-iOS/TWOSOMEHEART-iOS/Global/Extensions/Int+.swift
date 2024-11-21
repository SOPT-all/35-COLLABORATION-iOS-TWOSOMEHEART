//
//  Int+.swift
//  TWOSOMEHEART-iOS
//
//  Created by 김예지 on 11/18/24.
//

import Foundation

extension Int {
    // MARK: - 음료 금액 포맷팅 (천 단위 콤마 구분자)
    func formattedPrice() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "ko_KR")
        if let formattedString = formatter.string(from: NSNumber(value: self)) {
            return "\(formattedString)"
        }
        return "\(self)"
    }
}
