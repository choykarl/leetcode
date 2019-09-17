//
//  FibonacciNumber.swift
//  数据结构与算法
//
//  Created by karl on 2019/09/16.
//  Copyright © 2019 karl. All rights reserved.
//

//  https://leetcode-cn.com/problems/fibonacci-number/

import Foundation

class FibonacciNumber: LeetCode {
    // 1 1 2 3 5 8 13 21
    
    // 递归
    func fib1(_ n: Int) -> Int {
        
        if n <= 1 {
            return n
        }
        
        return fib1(n - 1) + fib1(n - 2)
    }
    
    /*
     计算出第N为的斐波那契数列对应的值.
     N的值 = N-1的值 + N-2的值
     
     斐波那契数列前两位都是1,所以N<=2的话就直接返回1
     用两个变量(n1和n2)来记录两个需要相加的值,默认值就位数列的前两个值,分别都是1.
     因为前两个值都是1,所以直接从第3位开始往后遍历.
     用一个临时遍历记录住n2
     然后n1+n2就是当前遍历的索引对应的斐波那契数列的值,将这个值给n2,这样n2相当于往后走了一位
     然后将临时遍历记录的值赋值给n1,因为临时遍历记录的是之前n2的值,赋值给n1以后,n1也相当于往后走了一位.
     
    n1  n2
     1   1
     ------------------
        n1   n2
     1   1    2
     ------------------
            n1   n2
     1   1   2   3
     ------------------
                n1  n2
     1   1   2   3   5
     */
    func fib2(_ N: Int) -> Int {
        
        if N <= 0 {
            return 0
        } else if N <= 2 {
            return 1
        }
        
        var n1 = 1
        var n2 = 1
        
        for _ in 3 ... N {
            let tmp = n2
            n2 = n1 + n2
            n1 = tmp
        }
        return n2
    }
    
    class func execute() {
        let ins = FibonacciNumber();
        let result = ins.fib2(6) // 8
        print(result)
    }
}
