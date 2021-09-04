//
//  APIClient.swift
//  SwiftyVolley
//
//  Created by GRK on 2021/6/20.
//

import Alamofire

open class APIClient {
    
    lazy var session: Session = {
        let s = Session()
        return s
    }()
        
    let requestEncoder: RequestEncoder
            
    public init(requestEncoder: RequestEncoder) {
        self.requestEncoder = requestEncoder
    }
    
    public func request<Response: Decodable>(endpoint: Endpoint<Response>, completion: @escaping (Result<Response, Error>) -> Void) {
        ///
        requestEncoder.encodeRequest(for: endpoint) { [weak self] (result) in
            ///
            var req: URLRequest
            do {
                req = try result.get()
            } catch {
                completion(.failure(error))
                return
            }
            
            self?.session.request(req).responseDecodable(of: Response.self) { rsp in
                switch rsp.result {
                case let .success(value):
                    completion(.success(value))
                case let .failure(error):
                    completion(.failure(error))
                }
            }
        }
    }
    
}
