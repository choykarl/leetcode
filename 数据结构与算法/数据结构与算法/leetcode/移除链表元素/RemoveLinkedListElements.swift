//
//  RemoveLinkedListElements.swift
//  数据结构与算法
//
//  Created by karl on 2019/09/20.
//  Copyright © 2019 karl. All rights reserved.
//

import Foundation

class RemoveLinkedListElements: LeetCode {

    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        
        var tmpNode = head
        var preNode = head
        while tmpNode != nil {
            if tmpNode?.val == val {
                if (tmpNode?.next != nil) {
                    tmpNode?.val = tmpNode!.next!.val
                    tmpNode?.next = tmpNode?.next?.next
                } else { // 走到这里表示最后一个节点也符合条件.
                    if head?.next == nil { // 全部节点都符合条件
                        return nil
                    } else { // 最后一个节点符合条件,就将上一个节点的next指向空
                        preNode?.next = nil
                        return head
                    }
                }
            } else {
                preNode = tmpNode
                tmpNode = tmpNode?.next
            }
        }
        
        return head
    }
    
    static func execute() {
        let node = ListNode(3)
        let node1 = ListNode(3)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        
        node.next = node1
        node1.next = node2
        node2.next = node3
        
        
        let ins = RemoveLinkedListElements()
        
        let res = ins.removeElements(node, 3)
        
        print(res?.log() ?? "")
        
    }
}
