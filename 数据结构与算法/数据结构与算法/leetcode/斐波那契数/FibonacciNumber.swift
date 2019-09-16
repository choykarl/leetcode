//
//  FibonacciNumber.swift
//  数据结构与算法
//
//  Created by karl on 2019/09/16.
//  Copyright © 2019 karl. All rights reserved.
//

//  https://leetcode-cn.com/problems/fibonacci-number/

import Foundation

class FibonacciNumber: NSObject {
    // 1 1 2 3 5 8 13 21
    
    // 递归
    func fib1(_ n: Int) -> Int {
        
        if n <= 1 {
            return n
        }
        
        return fib1(n - 1) + fib1(n - 2)
    }
    
    func fib2(_ N: Int) -> Int {
        
        if N <= 0 {
            return 0
        } else if N <= 2 {
            return 1
        }
        
        var n1 = 1
        var n2 = 1
        
        for _ in 3 ... N {
            let tmp = n1
            n1 = n1 + n2
            n2 = tmp
        }
        return n1
    }
    
    class func execute() {
        let ins = FibonacciNumber();
        let result = ins.fib2(1)
        print(result)
    }
}
