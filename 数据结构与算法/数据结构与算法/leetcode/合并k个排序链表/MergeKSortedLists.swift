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
        
        let head = ListNode(0)
        var tmpNode: ListNode? = head
        
        var count = 0
        while true {
            
            var minIndex = -1
            for i in 0 ..< array.count { // 找出数组中最小的索引
                count += 1
                guard let node = array[i] else {
                    continue
                }
                
                if minIndex == -1 || node.val <= array[minIndex]!.val {
                    minIndex = i
                }
            }
            
            if minIndex == -1 {
                break
            }
            
            // 串起来
            tmpNode?.next = array[minIndex]
            tmpNode = array[minIndex]
            
            // 将当前找到的索引位置的节点指向下一个
            array[minIndex] = array[minIndex]?.next
        }
        print("count = ", count)
        return head.next
    }
    
    static func execute() {
        
        
        let array = [node1(), node2(), node3()]
        
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
//                        if count == 1000 {
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
