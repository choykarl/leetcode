//
//  RemoveDuplicatesFromSortedList.swift
//  数据结构与算法
//
//  Created by karl on 2019/09/25.
//  Copyright © 2019 karl. All rights reserved.
//
// https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list/submissions/

import Foundation

class RemoveDuplicatesFromSortedList: LeetCode {
    
    // 挨个找
    // (n - 1) * n / 2 = (n^2 - n) / 2
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var count = 0
        var cur = head
        var moveNode = cur?.next
        var preNode = head
        while cur != nil {
            while moveNode != nil {
                count += 1
                if moveNode!.val == cur!.val {
                    preNode?.next = moveNode?.next
                } else {
                    preNode = moveNode
                }
                moveNode = moveNode?.next
            }
            cur = cur?.next
            moveNode = cur?.next
            preNode = cur
        }
        
        print("count = ", count)
        return head
    }
    
    func deleteDuplicates2(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        // 存储value出现的个数
        var map = [Int: Int]()
        
        var cur = head
        var moveNode = cur?.next
        var preNode = head
        while cur != nil {
            if map.count > 0 && map[cur!.val]! <= 1 {
                cur = cur?.next
                moveNode = cur?.next
                preNode = cur
                continue
            }
            while moveNode != nil {
                if map[moveNode!.val] != nil {
                    map[moveNode!.val] = map[moveNode!.val]! + 1
                } else {
                    map[moveNode!.val] = 1
                }
                if moveNode!.val == cur!.val {
                    preNode?.next = moveNode?.next
                } else {
                    preNode = moveNode
                }
                moveNode = moveNode?.next
            }
            cur = cur?.next
            moveNode = cur?.next
            preNode = cur
        }
        
        return head
    }
    
    static func execute() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(3)
        let node5 = ListNode(4)
        let node6 = ListNode(3)
         // (6 - 1) * 6 / 2
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        node5.next = node6
        
        let ins = RemoveDuplicatesFromSortedList()
        let res = ins.deleteDuplicates2(node1)
        print(res?.log() ?? "")
        
    }
}
