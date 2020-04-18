//
//  ValidParentheses.swift
//  数据结构与算法
//
//  Created by 蔡浩浩 on 2020/4/19.
//  Copyright © 2020 karl. All rights reserved.
//

// https://leetcode-cn.com/problems/valid-parentheses/

import Foundation

class ValidParentheses: LeetCode {
    
    func isValid(_ s: String) -> Bool {
        
        if s.count % 2 != 0 {
            return false
        }
        
        var stack = [String.Element]()
        
        for c in s {
            if c == "(" || c == "[" || c == "{" {
                stack.append(c)
            } else if c == ")" && "(" != stack.popLast() {
                return false
            } else if c == "]" && "[" != stack.popLast() {
                return false
            } else if c == "}" && "{" != stack.popLast() {
                return false
            }
        }
        
        if !stack.isEmpty {
            return false
        }
        
        return true
    }
    
    static func execute() {
        
        let v = ValidParentheses()
        let res = v.isValid("){")
        print(res)
    }
}
