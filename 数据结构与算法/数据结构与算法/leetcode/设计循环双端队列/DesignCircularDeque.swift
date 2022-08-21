//
//  DesignCircularDeque.swift
//  数据结构与算法
//
//  Created by ChoiKarl on 2022/8/15.
//  Copyright © 2022 karl. All rights reserved.
//

/// https://leetcode.cn/problems/design-circular-deque/
import Foundation
class DesignCircularDeque: LeetCode {
    static func execute() {
        let d = DesignCircularDeque(3)
        d.insertLast(1)
        d.insertLast(2)
        d.insertLast(3)
    }
    
    var maxSize = 0
    var curSize = 0
    var head: DLinkListNode?, tail: DLinkListNode?
    init(_ k: Int) {
        maxSize = k
    }
    
    func insertFront(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        
        let node = DLinkListNode(value)
        if isEmpty() {
            head = node
            tail = head
        } else {
            node.next = head
            head?.pre = node
            head = node
        }
        curSize += 1
        return true
    }
    
    func insertLast(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        let node = DLinkListNode(value)
        if isEmpty() {
            head = node
            tail = head
        } else {
            tail?.next = node
            node.pre = tail
            tail = node
        }
        curSize += 1
        return true
    }
    
    func deleteFront() -> Bool {
        if isEmpty() {
            return false
        }
        
        let temp = head
        head = head?.next
        temp?.next = nil
        curSize -= 1
        if isEmpty() {
            tail = nil
        }
        return true
    }
    
    func deleteLast() -> Bool {
        if curSize == 0 {
            return false
        }
        
        let temp = tail
        tail = tail?.pre
        temp?.pre = nil
        curSize -= 1
        if isEmpty() {
            head = nil
        }
        return true
    }
    
    func getFront() -> Int {
        if isEmpty() {
            return -1
        }
        
        return head?.val ?? -1
    }
    
    func getRear() -> Int {
        if isEmpty() {
            return -1
        }
        
        return tail?.val ?? -1
    }
    
    func isEmpty() -> Bool {
        return curSize == 0
    }
    
    func isFull() -> Bool {
        return curSize == maxSize
    }
}

