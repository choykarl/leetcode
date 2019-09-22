//
//  MergeKSortedLists.swift
//  数据结构与算法
//
//  Created by 蔡浩浩 on 2019/9/21.
//  Copyright © 2019 karl. All rights reserved.
//

import Foundation

class MergeKSortedLists: LeetCode {
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.count == 0 {
            return nil
        }
        
        if lists.count == 1 {
            return lists[0]
        }
        
        var array = lists
        
        var value: Int?
        var minIndex = -1
        
        let head = ListNode(0)
        var tmpNode: ListNode? = head
        
        
        var canBreak = 0
        while true {
            for i in 0 ..< array.count {
                let node = array[i]
                if node != nil {
                    if value == nil || node!.val <= value! {
                        value = node!.val
                        minIndex = i
                    }
                } else {
                    canBreak += 1
                }
                
                if i == array.count - 1 {
                    if minIndex != -1 {
                        tmpNode?.next = array[minIndex]
                        tmpNode = array[minIndex]
                        array[minIndex] = array[minIndex]?.next
                        minIndex = -1
                        value = nil
                        canBreak = 0
                    }
                }
            }
            
            if canBreak == array.count {
                break
            }
        }
        
        return head.next
    }
    
    static func execute() {
        
        
        let array = [node1(), node2(), node3()]
        

        
        
        
//        for items in caseArray {
//
//        }
        
        
        let ins = MergeKSortedLists()
//        let res = ins.mergeKLists(array)
        
        var count = 0
        if let data = try? Data(contentsOf: URL(fileURLWithPath: "/Users/caihaohao/Desktop/test.json")) {
            if let dict = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: [[Int]]] {
                if let items = dict["caseArray"] {
                    var nodeArray = [ListNode]()
                    for ints in items {
                        for int in ints {
                            let node = ListNode(int)
                            nodeArray.append(node)
                            count += 1
                        }
//                        if count == 3000 {
//                            break
//                        }
                    }
                    let res = ins.mergeKLists(nodeArray)
                    print(res?.log() ?? "")
                }
            }
        }
        
//        print(res?.log() ?? "")
    }
    
    static func node1() -> ListNode {
        let node = ListNode(1)
        let node1 = ListNode(3)
        let node2 = ListNode(5)
        let node3 = ListNode(7)
        node.next = node1
        node1.next = node2
        node2.next = node3
        
        return node
    }
    
    static func node2() -> ListNode {
        let node = ListNode(0)
        let node1 = ListNode(6)
        let node2 = ListNode(7)
        let node3 = ListNode(9)
        node.next = node1
        node1.next = node2
        node2.next = node3
        
        return node
    }
    
    static func node3() -> ListNode {
        let node = ListNode(2)
        let node1 = ListNode(4)
        let node2 = ListNode(8)
        let node3 = ListNode(12)
        node.next = node1
        node1.next = node2
        node2.next = node3
        
        return node
    }
}
