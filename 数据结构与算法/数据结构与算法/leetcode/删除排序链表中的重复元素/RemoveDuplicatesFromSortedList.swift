//
//  RemoveDuplicatesFromSortedList.swift
//  数据结构与算法
//
//  Created by karl on 2019/09/25.
//  Copyright © 2019 karl. All rights reserved.
//
// https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list/submissions/

import Foundation

/**
 deleteDuplicates,deleteDuplicates1,deleteDuplicates2都可以处理无序的链表
 */
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
    
    // 将出现的值存到数组里,下次再出现这个值,直接过滤掉
    func deleteDuplicates3(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }

        var cache = [Int]()

        let dumpHead = ListNode(0)
        var moveNode = head?.next
        var joinNode = ListNode(head!.val)
        cache.append(head!.val)
        dumpHead.next = joinNode
        while let tmp = moveNode {
            moveNode = moveNode?.next
            if !cache.contains(tmp.val) {
                cache.append(tmp.val)
                joinNode.next = tmp
                joinNode = tmp
                tmp.next = nil
            }
        }

        return dumpHead.next
    }
    
    // 只能删除有序链表的重复节点
    func deleteDuplicates4(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var cur = head
        
        while cur != nil {
            if cur?.val == cur?.next?.val {
                cur?.next = cur?.next?.next
            } else {
                cur = cur?.next
            }
        }
        
        return head
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
        
        let ins = RemoveDuplicatesFromSortedList()
        let res = ins.deleteDuplicates4(node1)
        print(res?.log() ?? "")
        
    }
}
