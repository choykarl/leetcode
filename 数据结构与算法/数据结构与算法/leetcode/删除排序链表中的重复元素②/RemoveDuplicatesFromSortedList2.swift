//
//  RemoveDuplicatesFromSortedList2.swift
//  数据结构与算法
//
//  Created by 蔡浩浩 on 2019/9/25.
//  Copyright © 2019 karl. All rights reserved.
//

// https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list-ii/

import Foundation

class RemoveDuplicatesFromSortedList2: LeetCode {
    
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        let dumpHead = ListNode(0)
        var preNode: ListNode? = dumpHead
        var moveNode = head
        dumpHead.next = moveNode
        
        while moveNode != nil {
            var flag = false
            // 先去重,有重复值值保留一个
            while moveNode?.val == moveNode?.next?.val {
                moveNode?.next = moveNode?.next?.next
                flag = true
            }
            
            // 判断是否执行了去重,如果执行了,就将这个节点去掉.
            if flag {
                preNode?.next = moveNode?.next
            } else { // 没有执行去重,就将当前节点当做上一个节点
                preNode = moveNode
            }
            // 往后移动
            moveNode = moveNode?.next
            
        }
        
        return dumpHead.next
    }
    
    static func execute() {
        let node1 = ListNode(1)
        let node2 = ListNode(1)
        let node3 = ListNode(2)
        let node4 = ListNode(3)
        let node5 = ListNode(4)
        let node6 = ListNode(4)
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        node5.next = node6
        
        let ins = RemoveDuplicatesFromSortedList2()
        let res = ins.deleteDuplicates(node1)
        print(res?.log() ?? "")
    }
}
