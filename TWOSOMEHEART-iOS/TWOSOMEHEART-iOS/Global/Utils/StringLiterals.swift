//
//  StringLiterals.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/17/24.
//

import Foundation

enum StringLiterals {
    
    enum MenuType {
        
        static let new = "NEW"
        
        static let recommend = "추천세트"
        
        static let coffee = "커피/음료"
        
        static let dessert = "디저트"
        
        static let food = "푸드"
        
        static let product = "상품"
        
    }

    enum CoffeeType {
        
        static let coffee = "커피"
        
        static let decaffeine = "디카페인커피"
        
        static let drinks = "음료"
        
        static let tea = "티/티라떼"
        
        static let icecream = "아이스크림/빙수"
        
    }
    
    
    enum MenuDetailType {
        static let noticeText = """
        • 제품 이미지는 실제 제품과 다소 차이가 있을 수 있습니다.\n(매장 계절에 따라 대체 과일 데코레이션으로 운영될 수 있습니다.)\n• 제품의 취급여부는 매장별로 상이할 수 있습니다.\n• 어린이, 임산부 등 카페인 민감자는 섭취에 주의해주시기 바랍니다.\n        
        """
    }
}
