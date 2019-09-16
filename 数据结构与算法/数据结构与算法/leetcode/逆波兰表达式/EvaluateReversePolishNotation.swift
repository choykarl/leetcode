//
//  EvaluateReversePolishNotation.swift
//  数据结构与算法
//
//  Created by karl on 2019/09/17.
//  Copyright © 2019 karl. All rights reserved.
//

// https://leetcode-cn.com/problems/evaluate-reverse-polish-notation/

import Foundation

class EvaluateReversePolishNotation: LeetCode {
    
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        for value in tokens {
            if "+-*/".contains(value) {
                let right = stack.removeLast()
                let left = stack.removeLast()
                var result = 0
                switch value {
                case "+":
                    result = left + right
                case "-":
                    result = left - right
                case "*":
                    result = left * right
                case "/":
                    result = left / right
                default:
                    result = 0
                }
                stack.append(result)
            } else {
                stack.append(Int(value)!)
            }
        }
        
        return stack.first!
    }
    
    class func execute() {
        let ins = EvaluateReversePolishNotation()
        let result = ins.evalRPN(["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]);
        print(result)
    }
}
