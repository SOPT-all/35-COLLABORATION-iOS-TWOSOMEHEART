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
        static let noticeText1 = """
        • 제품 이미지는 실제 제품과 다소 차이가 있을 수 있습니다.(매장 계절에 따라 대체 과일 데코레이션으로 운영될 수 있습니다.)
        """
        
        static let noticeText2 = """
        • 제품의 취급여부는 매장별로 상이할 수 있습니다.      
        """
        
        static let noticeText3 = """
        • 어린이, 임산부 등 카페인 민감자는 섭취에 주의해주시기 바랍니다.     
        """
    }

    
    enum MyMenuType {
        
        static let selectAll = "전체 선택"
        
        static let selectDelete = "선택 삭제"
        
        static let cart = "장바구니"
        
        static let orderNow = "지금 바로 주문"
        
        static let orderStore = "주문매장"
        
        static let storeName = "삼성역점"
        
        static let orderPrice = "주문금액"
        
        static let goOrder = "주문하기"
        
    }


    enum MenuOptionType {

        static let density = "농도"

        static let addShot = "샷 추가"

        static let vanillaSyrup = "바닐라시럽"

        static let hazelnutSyrup = "헤이즐넛시럽"

        static let caramelSyrup = "카라멜시럽"

        static let whippedCream = "휘핑크림"

        static let caramelDrizzle = "카라멜드리즐"

        static let chocolateDrizzle = "초콜릿드리즐"

        static let pricePerPlusOne = "(+1에 500원)"

    }

    enum AlertType {

        static let title = "선택된 상품을 My 투썸에서 삭제할까요?"

        static let cancel = "취소"

        static let confirm = "확인"

    }

}
