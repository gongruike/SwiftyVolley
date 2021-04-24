//
//  RequestType.swift
//  SwiftyVolley
//
//  Created by GRK on 2021/4/17.
//

import Alamofire

public protocol RequestType: URLRequestConvertible {
    
    var baseURL: URL { get }

    var path: String { get }

    var method: HTTPMethod { get }
    
    var headers: HTTPHeaders { get }

    var parameters: Parameters { get }
    
    var encoding: ParameterEncoding { get }
    
    var timeoutInterval: TimeInterval { get }
    
    var afRequest: Alamofire.Request? { get }
    
    func start(in queue: RequestQueue)
}

extension RequestType {
    public func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        
        var request = try URLRequest(url: url, method: method, headers: headers)
        request.timeoutInterval = timeoutInterval
        
        request = try encoding.encode(request, with: parameters)
        
        return request
    }
}
