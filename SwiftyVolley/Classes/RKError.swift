//
//  GRKError.swift
//  SwiftyVolley
//
//  Created by GRK on 2021/4/18.
//

import Foundation

public enum RKError: Swift.Error {
    //
    case invalidRequestType
    case requestGenerationFailed
    case requestCanceled
}

extension RKError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .invalidRequestType:
            return "Invalid request type"
        case .requestGenerationFailed:
            return "Fail to generate request"
        case .requestCanceled:
            return "Request has been canceled"
        }
    }
}
