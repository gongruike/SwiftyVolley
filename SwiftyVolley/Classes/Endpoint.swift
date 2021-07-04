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
    
    public let headers: HTTPHeaders?

    public let parameters: Encodable?

    public let timeoutInterval: TimeInterval

    public init(path: String,
                method: HTTPMethod = .get,
                headers: HTTPHeaders? = nil,
                parameters: Encodable? = nil,
                timeoutInterval: TimeInterval = 10
    ) {
        self.path = path
        self.method = method
        self.headers = headers
        self.parameters = parameters
        self.timeoutInterval = timeoutInterval
    }
    
}

public struct AnyEncodable: Encodable {
    
    public let encodable: Encodable
    
    public init(_ encodable: Encodable) {
        self.encodable = encodable
    }
    
    public func encode(to encoder: Encoder) throws {
        try encodable.encode(to: encoder)
    }
}

public struct EmptyResponse: Decodable {}
