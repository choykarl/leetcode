//
//  MergeKSortedLists.swift
//  数据结构与算法
//
//  Created by 蔡浩浩 on 2019/9/21.
//  Copyright © 2019 karl. All rights reserved.
//
// https://leetcode-cn.com/problems/merge-k-sorted-lists/

import Foundation

class MergeKSortedLists: LeetCode {
    
    // 将所有元素添加到一个数组里,然后排序,在拼接起来
    func mergeKLists3(_ lists: [ListNode?]) -> ListNode? {
        var array = [ListNode]()
        for var list in lists {
            while let node = list {
                array.append(node)
                list = node.next
            }
        }
        
        if array.count == 0 {
            return nil
        }
        
        if array.count == 1 {
            return array[0]
        }
        
        array.sort { (node1, node2) -> Bool in
            return node1.val < node2.val
        }
        
        let head = ListNode(0)
        var tmp = head
        head.next = tmp
        for node in array {
            tmp.next = node
            tmp = node
        }
        return head.next
    }
    
    // 分治策略(从复杂度算出的值来看效率最好,但是在leetcode上没有mergeKLists3效率高)
    // 每次先合并相邻的两个1和2,3和4,5和6这样先合并,合并的结果覆盖之前的1,3,5
    func mergeKLists2(_ lists: [ListNode?]) -> ListNode? {
        if lists.count == 0 {
            return nil
        }
        
        if lists.count == 1 {
            return lists[0]
        }
        
        var array = lists
        
        let merge2listIns = MergeTwoSortedLists()
        
        // 算出总共有几轮
        // 每一轮都是上一轮的一半
        var count = lists.count
        var rotateCount = 0
        while true {
            count = Int(ceil(Double(count) / 2))
            rotateCount += 1
            if count <= 1 {
                break
            }
        }
        
        var step = 1
        (1 ... rotateCount).forEach { (rotate) in
            var i = 0
            while i + step < array.count { // 每一轮合并相邻的两个,覆盖掉原先的值
                array[i] = merge2listIns.mergeTwoList4(array[i], array[i + step])
                i += 1 << rotate
            }
            step = 1 << rotate
        }
        
        return array[0]
    }
    
    // 优化mergeKLists2
    func mergeKLists2_2(_ lists: [ListNode?]) -> ListNode? {
        if lists.count == 0 {
            return nil
        }
        
        if lists.count == 1 {
            return lists[0]
        }
        
        var array = lists
        
        let merge2listIns = MergeTwoSortedLists()
        
        var step = 1
        while step < array.count {
            var i = 0
            let nextStep = step * 2
            while i + step < array.count { // 每一轮合并相邻的两个,覆盖掉原先的值
                array[i] = merge2listIns.mergeTwoList4(array[i], array[i + step])
                i += nextStep
            }
            step = nextStep
        }
        
        return array[0]
    }
    
    //
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
        let res = ins.mergeKLists(array)
        print(res?.log() ?? "")
    }
    
    static func execute2() {
        
        var count = 0
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: "/Users/caihaohao/Desktop/test.json")) else {
            return
        }
        guard let dict = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: [[Int]]] else {
            return
        }
        guard let items = dict["caseArray"] else {
            return
        }
        var nodeArray = [ListNode]()
        for ints in items {
            for int in ints {
                let node = ListNode(int)
                nodeArray.append(node)
                count += 1
            }
//            if count == 11 {
//                break
//            }
        }
        let ins = MergeKSortedLists()
        let res = ins.mergeKLists2_2(nodeArray)
        print(res?.log() ?? "")
            
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
