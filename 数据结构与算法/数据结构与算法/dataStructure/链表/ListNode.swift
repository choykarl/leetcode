//
//  ListNode.swift
//  数据结构与算法
//
//  Created by karl on 2019/09/25.
//  Copyright © 2019 karl. All rights reserved.
//

import Foundation

class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
    }
    
    func log() -> String {
        var s = ""
        var tmp: ListNode? = self
        while let v = tmp?.val {
            if tmp?.next != nil {
                s.append("\(v)-")
            } else {
                s.append("\(v)")
            }
            tmp = tmp?.next
        }
        return s
    }
}
