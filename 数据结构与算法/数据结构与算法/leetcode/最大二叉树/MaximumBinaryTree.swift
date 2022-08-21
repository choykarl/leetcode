//
//  MaximumBinaryTree.swift
//  数据结构与算法
//
//  Created by ChoiKarl on 2022/8/20.
//  Copyright © 2022 karl. All rights reserved.
//
/// https://leetcode.cn/problems/maximum-binary-tree/
import Foundation
class MaximumBinaryTree: LeetCode {
    static func execute() {
        print(MaximumBinaryTree().constructMaximumBinaryTree([3,2,1]))
    }
    
    var nodes = [Int?]()
    var root: TreeNode?
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        /// 将数组转化成前置遍历的节点
        /// 然后用前置遍历的节点创建出二叉树
        createNodes(nums: nums)
        // print(nodes)
        let root: TreeNode? = creatTree(getValue)
        return root
    }
    
    func createNodes(nums: [Int]) {
        if nums.count == 0 {
            nodes.append(nil)
            return
        }
        
        var maxValue = 0
        var maxIndex = 0
        for i in 0 ..< nums.count {
            if nums[i] > maxValue {
                maxValue = nums[i]
                maxIndex = i
            }
        }
        nodes.append(maxValue)
        var leftList: [Int]
        if nums.count == 1 {
            leftList = []
        } else if maxIndex == 0 {
            leftList = []
        } else {
            leftList = Array(nums[0 ..< maxIndex])
        }
        createNodes(nums: leftList)
        
        var rightList: [Int]
        if nums.count == 1 {
            rightList = []
        } else if maxIndex == nums.count - 1 {
            rightList = []
        } else {
            rightList = Array(nums[maxIndex + 1 ..< nums.count])
        }
        createNodes(nums: rightList)
    }
    
    func creatTree(_ value: Int?) -> TreeNode? {
        if value == nil {
            return nil
        }
        
        let node = TreeNode(value!)
        node.left = creatTree(getValue)
        node.right = creatTree(getValue)
        return node
    }
    
    var getValue: Int? {
        return nodes.isEmpty ? nil : nodes.removeFirst()
    }
}
