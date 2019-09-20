//
//  InkedListCycle.swift
//  数据结构与算法
//
//  Created by 蔡浩浩 on 2019/9/19.
//  Copyright © 2019 karl. All rights reserved.
//

// https://leetcode-cn.com/problems/linked-list-cycle/

import Foundation

class InkedListCycle: LeetCode {
    
    // 通过快慢指针, 默认都先指针head
    // 慢指针每次走一步,快指针每次走两步,如果有圈的话,快指针肯定会和慢指针相遇,如果没有圈,快指针会先指向nil
    func hasCycle(head: ListNode?) -> Bool {
        if head?.next == nil {
            return false
        }
        
        var fast = head
        var slow = head
        
        while true {
            fast = fast?.next?.next
            
            if fast == nil {
                return false
            } else if slow === fast {
                return true
            }
            
            slow = slow?.next
        }
    }
    
    static func execute() {
        let node = ListNode(1)
        let node1 = ListNode(3)
        let node2 = ListNode(5)
        let node3 = ListNode(7)
        
        node.next = node1
        node1.next = node2
        node2.next = node3
        node3.next = node
        
        let ins = InkedListCycle()
        let res = ins.hasCycle(head: nil)
        print(res)
    }
}
