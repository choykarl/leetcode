//
//  palindromeLinkedList.swift
//  数据结构与算法
//
//  Created by 蔡浩浩 on 2020/4/17.
//  Copyright © 2020 karl. All rights reserved.
//

import Foundation

// https://leetcode-cn.com/problems/palindrome-linked-list/

class PalindromeLinkedList: LeetCode {
    
    func isPalindrome1(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil {
            return true
        }
        
        // 只有两个节点
        if head?.next?.next == nil {
            if let headVal = head?.val, let nextVal = head?.next?.val, headVal == nextVal {
                return true
            } else {
                return false
            }
        }
        
        var slow = head
        var fast = head
        var pre: ListNode?
        
        // 将中间链表之前的节点反转
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            let next = slow?.next
            slow?.next = pre
            pre = slow
            slow = next
        }
        
        if fast != nil {
            slow = slow?.next
        }
        
        
        print(slow!.log())
        print(pre!.log())
        
        while pre != nil {
            if pre?.val != slow?.val {
                return false
            }
            pre = pre?.next
            slow = slow?.next
        }
        
        return true
    }
    
    static func execute() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let nodet = ListNode(4)
        let node5 = ListNode(3)
        let node6 = ListNode(2)
        let node7 = ListNode(1)
        
        node1.next = node2
        node2.next = node3
        node3.next = node4

        node4.next = nodet
        nodet.next = node5

        node5.next = node6
        node6.next = node7
        
        let l = PalindromeLinkedList()
        let result = l.isPalindrome1(node1)
        print(result);
    }
}
