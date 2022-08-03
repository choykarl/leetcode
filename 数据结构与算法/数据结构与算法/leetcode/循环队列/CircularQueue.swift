//
//  CircularQueue.swift
//  数据结构与算法
//
//  Created by ChoiKarl on 2022/8/3.
//  Copyright © 2022 karl. All rights reserved.
//

/// https://leetcode.cn/problems/design-circular-queue/

import Foundation

class CircularQueue: LeetCode {
    static func execute() {
        let r = CircularQueue(3)
        print(r.enQueue(1))
        print(r.enQueue(2))
        print(r.enQueue(3))
        print(r.enQueue(4))
        print(r.Rear())
        print(r.isFull())
        print(r.deQueue())
        print(r.enQueue(4))
        print(r.Rear())
    }
    
    
    var array = [Int]()
    var totalCount = 0;
    var front = 0
    var rear = 0

    init(_ k: Int) {
        totalCount = k + 1;
        array = Array(repeating: -1, count: totalCount)
    }

    func enQueue(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        array[rear] = value
        rear = (rear + 1) % totalCount
        return true
    }

    func deQueue() -> Bool {
        if isEmpty() {
            return false
        }
        array[front] = -1
        front = (front + 1) % totalCount

        return true;
    }

    func Front() -> Int {
        return array[front]
    }

    func Rear() -> Int {
        return array[(rear - 1 + totalCount) % totalCount]
    }

    func isEmpty() -> Bool {
        return rear == front;
    }

    func isFull() -> Bool {
        return (rear + 1) % totalCount == front
    }
}
