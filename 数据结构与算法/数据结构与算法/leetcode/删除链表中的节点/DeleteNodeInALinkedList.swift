//
//  DeleteNodeInALinkedList.swift
//  数据结构与算法
//
//  Created by 蔡浩浩 on 2019/9/18.
//  Copyright © 2019 karl. All rights reserved.
//

import Foundation

class DeleteNodeInALinkedList: LeetCode {
    func deleteNode(node: ListNode) {
        // 题目有说明,不考虑最后一个节点
        if let next = node.next {
            node.val = next.val
            node.next = next.next
        }
//        else { // 如果考虑最后一个节点,这里处理为nil就可以
//            node = nil
//        }
    }
    
    static func execute() {
        let node = ListNode(1)
        let node1 = ListNode(3)
        let node2 = ListNode(5)
        let node3 = ListNode(7)
        let node4 = ListNode(9)
        
        node.next = node1
        node1.next = node2
        node2.next = node3
        node3.next = node4
        
        let ins = DeleteNodeInALinkedList()
        ins.deleteNode(node: node4)
        
        print(node.log())
    }
}
