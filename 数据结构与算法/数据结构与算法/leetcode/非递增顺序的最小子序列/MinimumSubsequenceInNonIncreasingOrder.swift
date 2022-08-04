//
//  MinimumSubsequenceInNonIncreasingOrder.swift
//  数据结构与算法
//
//  Created by ChoiKarl on 2022/8/4.
//  Copyright © 2022 karl. All rights reserved.
//

/// https://leetcode.cn/problems/minimum-subsequence-in-non-increasing-order/

import Foundation

class MinimumSubsequenceInNonIncreasingOrder: LeetCode {
    static func execute() {
        print(MinimumSubsequenceInNonIncreasingOrder().minSubsequence([4,3,10,9,8]))
    }
    
    /// 计算出数组里数字的总和`totalSum`
    /// 给数组做升序,此时大数都在数组后面
    /// 从排序好的数组后面依次取值相加然后记录下来`currentSum`
    /// 如果`totalSum - currentSum < currentSum`,则表示剩下的数字之和不会大于`currentSum`了
    func minSubsequence(_ nums: [Int]) -> [Int] {
        if nums.count == 1 {
            return nums
        }
        
        let totalSum = nums.reduce(0, +)
        let arrayCount = nums.count
        let sortArray = nums.sorted()
        var currentSum = 0
        var index = arrayCount - 1
        var rtnArray = [Int]()
        while true {
            if (totalSum - currentSum < currentSum) {
                return rtnArray
            }
            let value = sortArray[index]
            rtnArray.append(value)
            currentSum += value
            index -= 1
        }
    }
    
    /// 先给数组做升序,此时大数都在数组后面
    /// 在排序好的数组里从后往前依次将截成两个数组,然后比较大小
    func minSubsequence1(_ nums: [Int]) -> [Int] {
        if nums.count == 1 {
            return nums
        }
        
        let arrayCount = nums.count
        let sortArray = nums.sorted()
        
        var limit = 1
        while true {
            let p = sortArray[arrayCount - limit ... arrayCount - 1]
            if p.reduce(0, +) > sortArray[0 ..< arrayCount - limit].reduce(0, +) {
                return Array(p).sorted(by: >)
            } else {
                limit += 1
            }
        }
    }
}
