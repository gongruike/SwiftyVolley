//
//  Endpoint+User.swift
//  SwiftyVolley_Example
//
//  Created by GRK on 2021/7/4.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import SwiftyVolley

extension Endpoint {
    
    static func getUserBasicInfo(_ uid: UInt64) -> Endpoint<EmptyResponse> {
        .init(path: "/user/basic/\(uid)")
    }
    
    static func getUserProfile(_ uid: UInt64) -> Endpoint<EmptyResponse> {
        .init(path: "/user/profile/\(uid)")
    }
    
}
