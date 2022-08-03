//
//  DeleteLinkListAllData.swift
//  数据结构与算法
//
//  Created by ChoiKarl on 2022/8/2.
//  Copyright © 2022 karl. All rights reserved.
//

import Foundation

class DeleteLinkListAllData: LeetCode {
    static func execute() {
        var node1: ListNode? = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let node5 = ListNode(5)
        let node6 = ListNode(6)
        let node7 = ListNode(7)
        
        node1?.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        node5.next = node6
        node6.next = node7
        
        DeleteLinkListAllData().delete(header: &node1);
        
        print(node1?.log());
    }
    
    func delete(header: inout ListNode?) {
        var temp = header?.next;
        while header != nil {
            header = temp?.next
            temp = header?.next
        }
    }
}
