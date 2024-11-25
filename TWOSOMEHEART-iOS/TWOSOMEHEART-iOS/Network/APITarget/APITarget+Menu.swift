//
//  APITarget+Menu.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/26/24.
//

import Foundation

import Moya

extension APITarget {
    enum Menu {
        case getMenuInfo(DTO.GetMenuInfoRequest)
        case postLikedMenu(DTO.PostLikedMenuRequest)
    }
}

extension APITarget.Menu: TargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }

    var path: String {
        switch self {
        case .getMenuInfo(let getMenuInfoRequest):
            return "api/v1/menu/\(getMenuInfoRequest.menuId)"
        case .postLikedMenu(let postLikedMenuRequest):
            return "api/v1/menu/\(postLikedMenuRequest.menuId)/likes"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getMenuInfo:
            return .get
        case .postLikedMenu:
            return .post
        }
    }

    var task: Moya.Task {
        switch self {
        case .getMenuInfo(let menuId):
            return .requestPlain
        case .postLikedMenu(let postLikedMenuRequest):
            return .requestParameters(
                parameters: ["name": postLikedMenuRequest.likedMenuInfo.name,
                             "price": postLikedMenuRequest.likedMenuInfo.price,
                             "temperature": postLikedMenuRequest.likedMenuInfo.temperature,
                             "size": postLikedMenuRequest.likedMenuInfo.size,
                             "coffeeBean": postLikedMenuRequest.likedMenuInfo.coffeeBean,
                             "togo": postLikedMenuRequest.likedMenuInfo.togo,
                             "personal": postLikedMenuRequest.likedMenuInfo.personal],
                encoding: URLEncoding.default
            )
        }
    }

    var headers: [String : String]? {
        return [
            "Content-Type": "application/json",
            "memberId": "1" //임시
        ]
    }
}
