//
//  LinkedList.swift
//  0-数据结构与算法
//
//  Created by karl on 2019/07/10.
//  Copyright © 2019 karl. All rights reserved.
//

import Foundation

private class Node<T> {
    var value: T?
    var next: Node<T>?
}

class LinkedList<T> {
    private(set) var length = 0
    
    private var first: Node<T>?
    
    func add(_ value: T) {
        insert(value, at: length)
    }
    
    func insert(_ value: T, at index: Int) {
        if index > length {
            checkBound(index)
        }
        let node = Node<T>()
        node.value = value
        if index == 0 {
            node.next = first
            first = node
        } else {
            let preNode = getNode(index - 1)
            node.next = preNode?.next
            preNode?.next = node
        }
        length += 1
    }
    
    func remove(_ index: Int) {
        checkBound(index)
        if index == 0 {
            first = first?.next
        } else {
            let node = getNode(index)
            node?.value = node?.next?.value
            node?.next = node?.next?.next
        }
        length -= 1
    }
    
    func set( _ value: T, at index: Int) {
        getNode(index)?.value = value
    }
    
    func index(_ index: Int) -> T? {
        let node = getNode(index)
        return node?.value
    }
    
    private func getNode(_ index: Int) -> Node<T>? {
        checkBound(index)
        var node = first
        for i in 0 ... index where i > 0 {
            node = node?.next
        }
        return node
    }
    
    private func checkBound(_ index: Int) {
        assert(index >= 0 && index < length, "越界!")
    }
    
    
    func log() -> String {
        var s = ""
        var node = first
        while (node != nil) {
            if let value = node?.value {
                s.append("\(value)")
                if let _ = node?.next {
                    s.append(",")
                }
            }
            node = node?.next
        }
        return s
    }
    
    
    class func execute() {
        let list = LinkedList<String>()
        list.insert("0", at: list.length) // 0
        list.add("1") // 0, 1
        list.insert("2", at: 0) // 2, 0, 1
        list.remove(1) // 2, 1
        list.set("3", at: 1) // 2, 3
        list.add("4") // 2, 3, 4
        list.insert("5", at: list.length - 1) // 2, 3, 5, 4
        list.insert("6", at: 1) // 2, 6, 3, 5, 4
        list.remove(0) // 6, 3, 5, 4
        print(list.log(), "-------" ,list.index(2) ?? "error")
    }
}
