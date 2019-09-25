//
//  Int?+Operator.swift
//  数据结构与算法
//
//  Created by karl on 2019/09/26.
//  Copyright © 2019 karl. All rights reserved.
//

import Foundation

extension Optional where Wrapped == Int {

    static func <= (l: Self, r: Self) -> Bool {
        if l == nil {
            return true
        }
        if r == nil {
            return false
        }
        
        return l! <= r!
    }
}
