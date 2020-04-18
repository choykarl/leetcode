//
//  MinStack.swift
//  数据结构与算法
//
//  Created by 蔡浩浩 on 2020/4/19.
//  Copyright © 2020 karl. All rights reserved.
//

import Foundation

class MinStack: LeetCode {
    
    private var stack = [Int]()
    private var minValues = [Int]()
    
    init() {}
    
    func push(_ x: Int) {
        stack.append(x)
        let minV = minValues.last
        if minV == nil || x <= minValues.last! {
            minValues.append(x)
        }
    }
    
    func pop() {
        let v = stack.popLast()
        if v == minValues.last! {
            _ = minValues.popLast()
        }
    }
    
    func top() -> Int {
        return stack.last!
    }
    
    func getMin() -> Int {
        return minValues.last!
    }
    
    static func execute() {
        let m = MinStack()
        m.push(2)
        m.push(0)
        m.push(-4)
        m.push(5)
        m.push(-3)
        print(m.getMin())
        print(m.top())
        m.pop()
        print(m.top())
    }
}
