//
//  ValidateBinarySearchTree.swift
//  数据结构与算法
//
//  Created by karl on 2019/09/25.
//  Copyright © 2019 karl. All rights reserved.
//

// https://leetcode-cn.com/problems/validate-binary-search-tree/submissions/

import Foundation


class ValidateBinarySearchTree: LeetCode {
    
    var preValue: Int?
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        if isValidBST(root?.left) == false {
            return false
        }
        
        if preValue != nil && root!.val <= preValue! {
            return false
        }
        preValue = root?.val
        
        if isValidBST(root?.right) == false {
            return false
        }
        
        return true
    }
    
//    func isValidBST2(_ root: TreeNode?) -> Bool {
//        if root == nil {
//            return true
//        }
//
//        return checkNode(node: root, min: nil, max: nil)
//    }
//
//    func checkNode(node: TreeNode?, min: Int?, max: Int?) -> Bool {
//
//        if node?.val <= min {
//
//        }
//
//        return checkNode(node: node?.left, min: node?.left?.left?.val, max: max)
//
//    }
    
    static func execute() {
        
        let root = TreeNode(5)
        root.left = TreeNode(1)
        root.right = TreeNode(4)
        root.right?.left = TreeNode(3)
        root.right?.right = TreeNode(6)
        
        
        let ins = ValidateBinarySearchTree()
        let res = ins.isValidBST(root)
        print(res)
    }
    
    
}
