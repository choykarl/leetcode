//
//  GetKthFromEnd.swift
//  数据结构与算法
//
//  Created by 蔡浩浩 on 2020/4/18.
//  Copyright © 2020 karl. All rights reserved.
//

// https://leetcode-cn.com/problems/lian-biao-zhong-dao-shu-di-kge-jie-dian-lcof/

import Foundation

class GetKthFromEnd: LeetCode {
    // 用两个指针,指针1先向前走k步
    // 然后两个指针同时向前走,当指针1的next为空时,指针2正好走到倒数第k个位置上
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {

        if k <= 0 {
            return nil
        }
        
        var node1 = head
        var node2 = head
        
        for _ in 1 ..< k {
            node1 = node1?.next
        }
        
        // k超过链表的长度
        if node1 == nil {
            return nil
        }
        
        // k正好是整个链表的长度
        if node1?.next == nil {
            return head
        }
        
        while node1?.next != nil {
            node1 = node1?.next
            node2 = node2?.next
        }
        
        return node2
        
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
        
        let g = GetKthFromEnd()
        if let res = g.getKthFromEnd(node1, 6) {
            print(res.log())
        }
    }
}
