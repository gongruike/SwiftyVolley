//
//  Request.swift
//  SwiftyVolley
//
//  Created by GRK on 2021/4/17.
//

import Alamofire

open class Request<DataType, ValueType>: RequestType {
        
    public typealias CompletionHandler = (Result<ValueType, Swift.Error>) -> Void

    open var completion: CompletionHandler?
    
    open var baseURL: URL
    
    open var path: String

    open var method: HTTPMethod = .get
    
    open var headers: HTTPHeaders = HTTPHeaders()

    open var parameters: Parameters = [:]
    
    open var encoding: ParameterEncoding = URLEncoding()
    
    open var timeoutInterval: TimeInterval = 10
    
    open var afRequest: Alamofire.Request?
    
    open var dataRequest: DataRequest? { afRequest as? DataRequest }
    
    public init(baseURL: URL, path: String) {
        self.baseURL = baseURL
        self.path = path
    }
    
    open func start(in queue: RequestQueue) {
        afRequest = queue.session.request(self)
        afRequest?.resume()
    }
    
    open func cancel() {
        afRequest?.cancel()
    }
    
    open func deliver(_ dataResponse: AFDataResponse<DataType>) {
        
    }
}
