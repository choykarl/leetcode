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
    
    private var superNode: TreeNode?
    func isValidBST(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        if isValidBST(root?.left) == false {
            return false
        }
        
        // s: 13
        // r: 14
        if superNode != nil && root!.val <= superNode!.val {
            return false
        }
        
        // s: 14
        // r: 14
        superNode = root
        
        if isValidBST(root?.right) == false {
            return false
        }
        
        return true
    }
    
    static func logTree(node: TreeNode?) {
        if node == nil {
            return
        }
//        print("---------",node!.val)
        logTree(node: node?.left)
//        print(node!.val,"-------------")
        
        
        
        logTree(node: node?.right)
        print(node!.val,"==========")
        
    }
    
    static func execute() {
        
        let A = TreeNode(20)
        let B = TreeNode(15)
        let C = TreeNode(25)
        let D = TreeNode(13)
        let E = TreeNode(17)
        let F = TreeNode(14)
        let G = TreeNode(22)
        let H = TreeNode(27)
        let I = TreeNode(16)
        
        A.left = B
        A.right = C
        
        B.left = D
        B.right = E
        
        E.left = I
        
        D.right = F
        
        C.left = G
        C.right = H


        let ins = ValidateBinarySearchTree()
        let res = ins.isValidBST(A)
        print(res)
        
        
//        logTree(node: A)
    }
    
    
}
