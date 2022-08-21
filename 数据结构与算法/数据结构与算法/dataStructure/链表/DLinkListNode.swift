//
//  DLinkListNode.swift
//  数据结构与算法
//
//  Created by ChoiKarl on 2022/8/15.
//  Copyright © 2022 karl. All rights reserved.
//

import Foundation
class DLinkListNode {
    public var val: Int
    public var next: DLinkListNode?
    public var pre: DLinkListNode?
    public init(_ val: Int) {
        self.val = val
    }
    
    func log() -> String {
        var s = ""
        var tmp: DLinkListNode? = self
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
