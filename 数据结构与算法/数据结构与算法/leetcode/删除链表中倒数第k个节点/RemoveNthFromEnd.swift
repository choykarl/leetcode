//
//  RemoveNthFromEnd.swift
//  数据结构与算法
//
//  Created by 蔡浩浩 on 2020/4/18.
//  Copyright © 2020 karl. All rights reserved.
//

import Foundation
class RemoveNthFromEnd: LeetCode {
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        if n <= 0 {
            return nil
        }
        
        // 删除倒是第一个节点,也就是删除链表的最后一个节点
        if n == 1 {
            // 整个链表只有一个节点
            if head?.next == nil {
                return nil
            }
            // 一个虚拟头节点
            let virtual = ListNode(0)
            var node = head
            virtual.next = node
            // 找到倒数第二个节点
            while node?.next?.next != nil {
                node = node?.next
            }
            // 让倒数第二个节点的next指向空,就删掉了最后一个节点
            node?.next = nil
            return virtual.next
        }
        
        var node1 = head
        var node2 = head
        
        for _ in 1 ..< n {
            node1 = node1?.next
        }
        
        // n超过链表的长度
        if node1 == nil {
            return nil
        }
        
        // n正好是整个链表的长度, 相当于删除了头结点
        if node1?.next == nil {
            return head?.next
        }
        
        while node1?.next != nil {
            node1 = node1?.next
            node2 = node2?.next
        }
        
        if let next = node2?.next {
            node2?.val = next.val
            node2?.next = next.next
        }
        
        
        return head
    }
    
    static func execute() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let node5 = ListNode(5)
        let node6 = ListNode(6)
        let node7 = ListNode(7)
        
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        node5.next = node6
        node6.next = node7
        
        let r = RemoveNthFromEnd()
        if let res = r.removeNthFromEnd(node1, 1) {
            print(res.log())
        }
    }
}
