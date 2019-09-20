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

    // 性能比上一个方法好
    func removeElements2(_ head: ListNode?, _ val: Int) -> ListNode? {

        var tmpNode = head
        var preNode = head
        while tmpNode != nil {
            if tmpNode?.val == val { // 判断当前节点是够满足条件,满足条件的话就将上一个节点的next指向当前节点的next,
                preNode?.next = tmpNode?.next
            } else { // 只有不满足条件的时候,上一个节点才会改变,这样才能处理有连续符合条件的节点.
                preNode = tmpNode
            }
            // 当前节点往后走
            tmpNode = tmpNode?.next
        }

        // 上面的循环是处理不了第一个节点的
        // 判断第一个节点是否符合条件
        if (head?.val == val) {
            if (head?.next != nil) { // 第一个节点符合条件,并且下一个不为nil,直接将第一个节点替换成下一个节点
                head?.val = head!.next!.val
                head?.next = head?.next?.next
            } else { // 第一个节点的下一个为nil,这表示当前只有一个头结点了,头节点有符合过滤条件,所以直接返回nil就可以了
                return nil
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
