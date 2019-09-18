//
//  MergeTwoSortedLists.swift
//  数据结构与算法
//
//  Created by 蔡浩浩 on 2019/9/17.
//  Copyright © 2019 karl. All rights reserved.
//

// https://leetcode-cn.com/problems/merge-two-sorted-lists/

import Foundation

class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
    }
    
    func log() -> String {
        var s = ""
        var tmp: ListNode? = self
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

class MergeTwoSortedLists: LeetCode {
    
    /*
     因为是两个有序链表,所以每次都判断链表的第一个节点,取出值较小的拼在head这个链表后面,然后将这第一个节点删除.
     (将这个节点指向这个节点的下一个节点,就相当于删除这个节点).
     */
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil { return nil }
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        
        var head: ListNode?
        var next: ListNode?
        func setValue(node: inout ListNode?) {
            if head != nil {
                next?.next = node
                next = next?.next
            } else {
                next = node
                head = next
            }
            
            // 将当前节点指向当前节点的下一个节点,相当于删除当前节点.
            node = node?.next
        }
        
        var tmpL1: ListNode? = l1
        var tmpL2: ListNode? = l2
        
        while true {
            if let v1 = tmpL1?.val, let v2 = tmpL2?.val {
                if v1 <= v2 {
                    setValue(node: &tmpL1)
                } else {
                    setValue(node: &tmpL2)
                }
            } else if let _ = tmpL1 { // 只有tmpL1有值了,直接将tmpL1剩下的拼在后面
                next?.next = tmpL1
                break
            } else if let _ = tmpL2 {  // 只有tmpL2有值了,直接将tmpL2剩下的拼在后面
                next?.next = tmpL2
                break
            } else {
                break
            }
        }
        
        return head
    }
    
    // 递归形式
    func mergeTwoLists2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil { return nil }
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        
        var head: ListNode?
        if l1!.val < l2!.val {
            head = l1
            head?.next = mergeTwoLists2(head?.next, l2)
        } else {
            head = l2
            head?.next = mergeTwoLists2(l1, head?.next)
        }
        
        return head
    }
    
    // 思路同`mergeTwoLists2`,只是精简了代码
    func mergeTwoLists3(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil { return nil }
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        
        if l1!.val < l2!.val {
            l1?.next = mergeTwoLists2(l1?.next, l2)
            return l1
        } else {
            l2?.next = mergeTwoLists2(l1, l2?.next)
            return l2
        }
    }
    
    // 思路同`mergeTwoLists`,但是使用虚拟头节点可以精简点代码
    func mergeTwoList4(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil { return nil }
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        
        let head = ListNode(0)
        var next: ListNode? = head
        
        var tmpL1: ListNode? = l1
        var tmpL2: ListNode? = l2
        
        while tmpL1 != nil && tmpL2 != nil {
            if tmpL1!.val <= tmpL2!.val {
                next?.next = tmpL1
                next = next?.next
                tmpL1 = tmpL1?.next
            } else {
                next?.next = tmpL2
                next = next?.next
                tmpL2 = tmpL2?.next
            }
        }
         if let _ = tmpL1 {
            next?.next = tmpL1
        } else if let _ = tmpL2 {
            next?.next = tmpL2
        }
        
        return head.next
    }
    
    static func execute() {
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
        
        
        let ins = MergeTwoSortedLists()
        if let node = ins.mergeTwoList4(a1, a2) {
            print(node.log())
        }
    }
}
