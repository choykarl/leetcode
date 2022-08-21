//
//  DeepestLeavesSum.swift
//  数据结构与算法
//
//  Created by ChoiKarl on 2022/8/17.
//  Copyright © 2022 karl. All rights reserved.
//

/// https://leetcode.cn/problems/deepest-leaves-sum/
import Foundation
class DeepestLeavesSum: LeetCode {
    static func execute() {
        let n1 = TreeNode(1)
        let n2 = TreeNode(2)
        let n3 = TreeNode(3)
        let n4 = TreeNode(4)
        let n5 = TreeNode(5)
        let n6 = TreeNode(6)
        let n7 = TreeNode(7)
        let n8 = TreeNode(8)
        
        n1.left = n2
        n1.right = n3
        
        n2.left = n4
        n2.right = n5
        
        n3.right = n6
        
        n4.left = n7
        
        n6.right = n8
        
        print(DeepestLeavesSum().deepestLeavesSum(n1))
    }
    
    var total = 0
    var maxDeep = 0
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        
        forTree(node: root, deep: 1)
        print(maxDeep)
        return total
    }
    
    /// 最深节点一定是叶子节点,所以记录深度
    /// 遇到深度更大的节点,则表示还有比之前更深的节点,覆盖之前的相加之和
    /// 最大深度的节点值相加
    func forTree(node: TreeNode?, deep: Int) {
        if node == nil {
            return
        }
        
        if deep > maxDeep {
            maxDeep = deep
            total = node!.val
        } else if (deep == maxDeep) {
            total += node!.val
        }
        
        forTree(node: node?.left, deep: deep + 1)
        
        forTree(node: node?.right, deep: deep + 1)
    }
}
