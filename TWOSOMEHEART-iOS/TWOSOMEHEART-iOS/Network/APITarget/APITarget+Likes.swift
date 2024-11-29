//
//  APITarget+Likes.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/26/24.
//

import Foundation

import Moya

extension APITarget {
    enum Likes {
        case getLikedMenu
        case deleteLikedMenu(DTO.DeleteLikedMenuRequest)
    }
}

extension APITarget.Likes: TargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }

    var path: String {
        return "api/v1/likes"
    }

    var method: Moya.Method {
        switch self {
        case .getLikedMenu:
            return .get
        case .deleteLikedMenu:
            return .delete
        }
    }

    var task: Moya.Task {
        switch self {
        case .getLikedMenu:
            return .requestPlain
        case .deleteLikedMenu(let deleteInfoMenuRequest):
            if deleteInfoMenuRequest.all == "true" {
                return .requestParameters(
                    parameters: ["all": deleteInfoMenuRequest.all],
                    encoding: URLEncoding.queryString
                )
            } else {
                return .requestParameters(
                    parameters: ["favoriteIds": deleteInfoMenuRequest.favoriteIds],
                    encoding: URLEncoding.queryString
                )
            }
        }
    }

    var headers: [String : String]? {
        return [
            "Content-Type": "application/json",
            "Authorization": "1"
        ]
    }
}
