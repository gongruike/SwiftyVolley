//
//  RequestEncoder.swift
//  SwiftyVolley
//
//  Created by GRK on 2021/6/26.
//

import Foundation
import Alamofire

public protocol RequestEncoder {
    
    ///
    /// - Parameters:
    ///   - endpoint:
    ///   - completion:
    func encodeRequest<ResponsePayload: Decodable>(
        for endpoint: Endpoint<ResponsePayload>,
        completion: @escaping (Result<URLRequest, Error>) -> Void)
}

open class DefaultRequestEncoder: RequestEncoder {
    
    let baseURL: URL
    
    public init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    open func encodeRequest<ResponsePayload: Decodable>(
        for endpoint: Endpoint<ResponsePayload>,
        completion: @escaping (Result<URLRequest, Error>) -> Void) {
                
        let url = baseURL.appendingPathComponent(endpoint.path)

        do {
            var request: URLRequest = try URLRequest(url: url, method: endpoint.method, headers: endpoint.headers)
            request.timeoutInterval = endpoint.timeoutInterval

            if let parameters = endpoint.parameters {
                request = try URLEncodedFormParameterEncoder.default.encode(AnyEncodable(parameters), into: request)
            }
            
            completion(.success(request))
        } catch {
            completion(.failure(error))
        }
    }
    
}
