//
//  MiddleOfTheLinkedList.swift
//  数据结构与算法
//
//  Created by 蔡浩浩 on 2019/9/25.
//  Copyright © 2019 karl. All rights reserved.
//

// https://leetcode-cn.com/problems/middle-of-the-linked-list/solution/
import Foundation

class MiddleOfTheLinkedList: LeetCode {

    func middleNode(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var fast = head
        var slow = head
        
        while true {
            let isEven = fast?.next != nil // 是否是偶数个节点
            
            fast = fast?.next?.next
            
            if fast == nil {
                if isEven {
                    return slow?.next
                } else {
                    return slow
                }
                
            }
            
            slow = slow?.next
        }
    }
    
    func middleNode2(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var fast = head
        var slow = head
        
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        return slow
    }
    
    static func execute() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let node5 = ListNode(5)
        let node6 = ListNode(6)
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        node5.next = node6
        
        let ins = MiddleOfTheLinkedList()
        let res = ins.middleNode(node1)
        print(res?.log() ?? "")
    }
}
