//
//  NetworkResult.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/26/24.
//

import Foundation

enum NetworkResult<T> {
    
    case success(T)  // 성공
    case requestErr  // 요청 에러
    case decodedErr  // 디코딩 에러
    case pathErr     // 경로 에러
    case serverErr   // 서버 내부 오류
    case networkFail // 네트워크 연결 실패 -> 네트워크 확인

}
