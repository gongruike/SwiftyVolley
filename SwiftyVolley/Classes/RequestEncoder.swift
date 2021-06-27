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

        var request: URLRequest
        do {
            request = try URLRequest(url: url, method: endpoint.method, headers: endpoint.headers)
            request = try URLEncoding.default.encode(request, with: endpoint.parameters)
            request.timeoutInterval = endpoint.timeoutInterval
            
            completion(.success(request))
        } catch {
            completion(.failure(error))
        }
    }
    
}
