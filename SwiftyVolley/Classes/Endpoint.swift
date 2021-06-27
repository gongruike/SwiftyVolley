//
//  Endpoint.swift
//  SwiftyVolley
//
//  Created by GRK on 2021/6/20.
//

import Alamofire

public struct Endpoint<ResponseType: Decodable> {
    
    public let path: String

    public let method: HTTPMethod
    
    public let headers: HTTPHeaders

    public let parameters: Parameters
        
    public var timeoutInterval: TimeInterval
    
    public init(path: String,
         method: HTTPMethod,
         headers: HTTPHeaders,
         parameters: Parameters,
         timeoutInterval: TimeInterval = 10
    ) {
        self.path = path
        self.method = method
        self.headers = headers
        self.parameters = parameters
        self.timeoutInterval = timeoutInterval
    }
    
}
