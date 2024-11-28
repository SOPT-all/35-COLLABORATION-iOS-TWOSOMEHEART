//
//  StringLiterals.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/17/24.
//

import Foundation

enum StringLiterals {

    enum NavigationBarType {

        static let title = "투썸오더"

    }

    enum SelectedStoreType {

        static let title = "주문 매장"

        static let storeName = "수원정자점"

        static let distance = "418m"

        static let change = "변경"

    }

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
        • 제품 이미지는 실제 제품과 다소 차이가 있을 수 있습니다.
          (매장 계절에 따라 대체 과일 데코레이션으로 운영될 수
          있습니다.)
        """
        
        static let noticeText2 = """
        • 제품의 취급여부는 매장별로 상이할 수 있습니다.      
        """
        
        static let noticeText3 = """
        • 어린이, 임산부 등 카페인 민감자는 섭취에 주의해주시기
          바랍니다.     
        """
        
        static let nutrionInfo = "제품 영양 정보"
        
        static let temperatureHot = "핫"
        
        static let temperatureIce = "아이스"
        
        static let sizeRegular = "레귤러"
        
        static let sizeLarge = "라지"
        
        static let allergy = "알레르기 유발요인"
        
        static let order = "주문하기"
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

    enum ModalType {
        
        static let personalCup = "개인컵 사용"

        static let personalCupDiscount = "-300원"

        static let personalCupExplain = "개인컵 사용 안내 >"

        static let personalOption = "퍼스널 옵션"

        static let order = "주문하기"

        static let hot = "핫"
        
        static let cold = "콜드"
        
        static let regular = "레귤러 (325ml)"

        static let large = "라지 (452ml)"

        static let firstBean = "블랙그라운드"
        
        static let secondBean = "아로마노트"
        
        static let thirdBean = "SWP디카페인"
        
        static let takeHome = "포장"
        
        static let drinkHere = "매장"
        
        static let noReuseCup = "일회용컵"
        
        static let reuseCup = "머그컵"
        
        static let temp = "온도"
        
        static let size = "사이즈"
        
        static let bean = "원두"
        
        static let pickup = "픽업방식"
        
        static let seeMyMenuList = "목록 보기"
        
        static let successToastMessage = "즐겨찾기에 저장되었습니다"
        
        static let failToastMessage = "이미 저장된 메뉴입니다"
        
    }

    enum AlertType {

        static let title = "선택된 상품을 My 투썸에서 삭제할까요?"

        static let cancel = "취소"

        static let confirm = "확인"

    }

}
