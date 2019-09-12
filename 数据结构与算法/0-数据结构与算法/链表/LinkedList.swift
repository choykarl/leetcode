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
}
