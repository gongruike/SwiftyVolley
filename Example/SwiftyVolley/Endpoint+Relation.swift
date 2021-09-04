//
//  Endpoint+Relation.swift
//  SwiftyVolley_Example
//
//  Created by GRK on 2021/7/4.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import SwiftyVolley

extension Endpoint {
    
    static func follow(_ uid: UInt64) -> Endpoint<EmptyResponse> {
        .init(path: "/follow/\(uid)", method: .post)
    }
    
    static func unfollow(_ uid: UInt64) -> Endpoint<EmptyResponse> {
        .init(path: "/unfollow/\(uid)", method: .post)
    }
    
    static func block(_ uid: UInt64) -> Endpoint<EmptyResponse> {
        .init(path: "/block/\(uid)", method: .post)
    }
    
    static func unblock(_ uid: UInt64) -> Endpoint<EmptyResponse> {
        .init(path: "/unblock/\(uid)", method: .post)
    }
    
}
