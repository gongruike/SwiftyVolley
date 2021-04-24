//
//  SwiftyJSONRequest.swift
//  SwiftyVolley
//
//  Created by 贡瑞可 on 2021/4/24.
//

import Alamofire
import SwiftyJSON

class SwiftyJSONRequest<ValueType>: Request<JSON, ValueType> {

    override func start(in queue: RequestQueue) {
        super.start(in: queue)
        
        dataRequest?.responseSwiftyJSON(completionHandler: { [weak self] rsp in
            self?.deliver(rsp)
        })
    }
    
}

public final class SwiftyJSONResponseSerializer: ResponseSerializer {
    public let dataPreprocessor: DataPreprocessor
    public let emptyResponseCodes: Set<Int>
    public let emptyRequestMethods: Set<HTTPMethod>

    public init(dataPreprocessor: DataPreprocessor = JSONResponseSerializer.defaultDataPreprocessor,
                emptyResponseCodes: Set<Int> = JSONResponseSerializer.defaultEmptyResponseCodes,
                emptyRequestMethods: Set<HTTPMethod> = JSONResponseSerializer.defaultEmptyRequestMethods) {
        self.dataPreprocessor = dataPreprocessor
        self.emptyResponseCodes = emptyResponseCodes
        self.emptyRequestMethods = emptyRequestMethods
    }

    public func serialize(request: URLRequest?, response: HTTPURLResponse?, data: Data?, error: Error?) throws -> JSON {
        guard error == nil else { throw error! }

        guard var data = data, !data.isEmpty else {
            guard emptyResponseAllowed(forRequest: request, response: response) else {
                throw AFError.responseSerializationFailed(reason: .inputDataNilOrZeroLength)
            }

            return JSON.null
        }

        data = try dataPreprocessor.preprocess(data)

        do {
            return try JSON(data: data)
        } catch {
            throw AFError.responseSerializationFailed(reason: .jsonSerializationFailed(error: error))
        }
    }
}

extension DataRequest {

    @discardableResult
    public func responseSwiftyJSON(queue: DispatchQueue = .main,
                                   dataPreprocessor: DataPreprocessor = SwiftyJSONResponseSerializer.defaultDataPreprocessor,
                                   emptyResponseCodes: Set<Int> = SwiftyJSONResponseSerializer.defaultEmptyResponseCodes,
                                   emptyRequestMethods: Set<HTTPMethod> = SwiftyJSONResponseSerializer.defaultEmptyRequestMethods,
                                   completionHandler: @escaping (AFDataResponse<JSON>) -> Void) -> Self {
        response(queue: queue,
                 responseSerializer: SwiftyJSONResponseSerializer(dataPreprocessor: dataPreprocessor,
                                                                  emptyResponseCodes: emptyResponseCodes,
                                                                  emptyRequestMethods: emptyRequestMethods),
                 completionHandler: completionHandler)
    }
}
