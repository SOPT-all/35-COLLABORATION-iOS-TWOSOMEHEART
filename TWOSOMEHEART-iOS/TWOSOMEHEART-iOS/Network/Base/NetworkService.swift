//
//  APIProvider.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/26/24.
//

import Foundation

import Moya

final class NetworkService<T: TargetType> {

    let provider: MoyaProvider<T>
    
    init(plugins: [PluginType] = [TSPlugin()]) {
        self.provider = MoyaProvider<T>(plugins: plugins)
    }
    
    func request<U: Decodable>(
        type: U.Type,
        target: T,
        completion: @escaping (NetworkResult<U>) -> Void
    ) {
        provider.request(target) { [weak self] result in
            guard let self else {
                completion(.networkFail)
                return
            }
            switch result {
            case .success(let response):
                handleResponse(response: response,
                              type: type,
                              completion: completion) // 서버에서 적어도 code는 전달됨
            case .failure:
                completion(.networkFail) // 네트워크 통신 실패
            }
        }
    }

    // MARK: - Response Handler
    
    private func handleResponse<U: Decodable>(
        response: Response,
        type: U.Type,
        completion: @escaping (NetworkResult<U>) -> Void
    ) {
        let networkResult = judgeStatus(
            statusCode: response.statusCode,
            data: response.data,
            type: type
        )
        completion(networkResult)
    }
    
    private func judgeStatus<U: Decodable>(
        statusCode: Int,
        data: Data,
        type: U.Type
    ) -> NetworkResult<U> {
        switch statusCode {
        case 200..<205:
            return decodeData(data: data, type: type)
        case 400..<500:
            return .requestErr
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    // MARK: - 데이터 디코딩
    
    private func decodeData<U: Decodable>(
        data: Data,
        type: U.Type
    ) -> NetworkResult<U> {
        
        if data.isEmpty {
            return handleEmptyData(type: type)
        }
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(type, from: data)
            return .success(decodedData)
        } catch {
            logDecodingError(error: error,
                             type: type,
                             data: data)
            return .decodedErr
        }
    }
    
    // MARK: - decodeData 에러핸들링
    
    private func handleEmptyData<U: Decodable>(type: U.Type) -> NetworkResult<U> {
        if type == EmptyResponse.self {
            return .success(EmptyResponse() as! U)
        } else {
            print("⛔️ Expected \(type) but received empty response ⛔️")
            return .decodedErr
        }
    }
    
    private func logDecodingError<U>(error: Error, type: U.Type, data: Data) {
        print("⛔️ \(Self.self)에서 디코딩 오류가 발생했습니다 ⛔️")
        print("오류 내용: \(error.localizedDescription)")
        print("디코딩하려는 타입: \(type)")
        if let jsonString = String(data: data, encoding: .utf8) {
            print("JSON 응답 데이터: \(jsonString)")
        }
    }
    
}
