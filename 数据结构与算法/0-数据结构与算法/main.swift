//
//  main.swift
//  数据结构与算法
//
//  Created by karl on 2019/07/07.
//  Copyright © 2019 karl. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

let a1 = ListNode(1)
a1.next = ListNode(3)
a1.next?.next = ListNode(5)
a1.next?.next?.next = ListNode(9)


let a2 = ListNode(1)
a2.next = ListNode(6)
a2.next?.next = ListNode(7)
a2.next?.next?.next = ListNode(12)
a2.next?.next?.next?.next = ListNode(14)
a2.next?.next?.next?.next?.next = ListNode(19)


// 1-3-5-9
// 1-6-7-12


func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil && l2 == nil { return nil }
    if l1 == nil { return l2 }
    if l2 == nil { return l1 }
    
    var rtnNode: ListNode?
    var tmpNode: ListNode?
    
    func setValue(n: inout ListNode?) {
        if rtnNode != nil {
            tmpNode?.next = n
            tmpNode = tmpNode?.next
        } else {
            tmpNode = n
            rtnNode = tmpNode
        }
        
        n = n?.next
    }
    
    var tmpL1: ListNode? = l1
    var tmpL2: ListNode? = l2
    
    while true {
        if let v1 = tmpL1?.val, let v2 = tmpL2?.val {
            if v1 <= v2 {
                setValue(n: &tmpL1)
            } else {
                setValue(n: &tmpL2)
            }
        } else if let _ = tmpL1 {
            tmpNode?.next = tmpL1
            break
        } else if let _ = tmpL2 {
            tmpNode?.next = tmpL2
            break
        } else {
            break
        }
    }
    
    return rtnNode
}

let node = mergeTwoLists(a1, a2)

var s = ""
var tmp: ListNode? = node

while let v = tmp?.val {
    s.append("\(v)-")
    tmp = tmp?.next
}

print(s)
