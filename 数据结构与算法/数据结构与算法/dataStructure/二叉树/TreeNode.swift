//
//  TreeNode.swift
//  数据结构与算法
//
//  Created by karl on 2019/09/25.
//  Copyright © 2019 karl. All rights reserved.
//

import Foundation
public class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    func cxbl() -> [[Int]] {
        var result = [[Int]]()
        var queue = [TreeNode]()
        queue.append(self)
        while (queue.count != 0) {
            let count = queue.count
            var deepList = [Int]()
            for _ in 0 ..< count {
                let node = queue.removeFirst()
                deepList.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            result.append(deepList)
        }
        
        return result
    }
    
    func qxbl() -> [Int] {
        var result = [Int]()
        func bl(node: TreeNode?) {
            guard let node = node else {
                return
            }
            result.append(node.val)
            bl(node: node.left)
            bl(node: node.right)
        }
        bl(node: self)
        return result
    }
    
    func zxbl() -> [Int] {
        var result = [Int]()
        func bl(node: TreeNode?) {
            guard let node = node else {
                return
            }
            bl(node: node.left)
            result.append(node.val)
            bl(node: node.right)
        }
        bl(node: self)
        return result
    }
    
    func hxbl() -> [Int] {
        var result = [Int]()
        func bl(node: TreeNode?) {
            guard let node = node else {
                return
            }
            bl(node: node.left)
            bl(node: node.right)
            result.append(node.val)
        }
        bl(node: self)
        return result
    }
}

