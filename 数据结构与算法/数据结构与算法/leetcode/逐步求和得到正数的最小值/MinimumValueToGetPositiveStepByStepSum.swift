//
//  MinimumValueToGetPositiveStepByStepSum.swift
//  数据结构与算法
//
//  Created by ChoiKarl on 2022/8/9.
//  Copyright © 2022 karl. All rights reserved.
//

/// https://leetcode.cn/problems/minimum-value-to-get-positive-step-by-step-sum/
import Foundation

class MinimumValueToGetPositiveStepByStepSum: LeetCode {
    static func execute() {
        print(MinimumValueToGetPositiveStepByStepSum().minStartValue([-2,5,-3,-5,-2,7]))
    }
    
    func minStartValue(_ nums: [Int]) -> Int {
        
        var sum = 0
        var minSum = 0
        for num in nums {
            sum += num
            minSum = min(minSum, sum)
        }
        
        // 数组全是正数
        if minSum > 0 {
            return 1
        }
        
        return abs(minSum) + 1
    }
}
