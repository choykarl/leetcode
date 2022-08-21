//
//  MaximumScoreAfterSplittingAString.swift
//  数据结构与算法
//
//  Created by ChoiKarl on 2022/8/14.
//  Copyright © 2022 karl. All rights reserved.
//

/// https://leetcode.cn/problems/maximum-score-after-splitting-a-string/
import Foundation

class MaximumScoreAfterSplittingAString: LeetCode {
    static func execute() {
        print(MaximumScoreAfterSplittingAString().maxScore("1111"))
    }
    
    
    
    func maxScore(_ s: String) -> Int {
        var score = 0
        let count = s.count
        if s[0] == "0" {
            score += 1
        }
        
        for i in 1 ..< count {
            if s[i] == "1" {
                score += 1
            }
        }
        
        var ans = score
        
        for i in 1 ..< count - 1 {
            if s[i] == "0" {
                score += 1
            } else {
                score -= 1
            }
            ans = max(ans, score)
        }
        return ans
    }
    
    
    /// 遍历字符串,每次遍历都将字符串分为左右两串,分别计算左串0的数量和右串1的数量,然后将两边的结果相加
    /// 取整个遍历结果后的最大值
    func maxScore1(_ s: String) -> Int {
        var result = 0
        for i in 0 ..< s.count - 1 {
            let left = s[0 ... i]
            let right = s[i+1 ... s.count - 1]
            
            let leftCount = calculateCharCount(s: left, c: "0")
            let rightCount = calculateCharCount(s: right, c: "1")
            if leftCount + rightCount > result {
                result = leftCount + rightCount
            }
        }
        
        return result
    }
    
    func calculateCharCount(s: String, c: String.Element) -> Int {
        var count = 0
        for item in s {
            if item == c {
                count += 1
            }
        }
        return count
    }
}

extension String {
  public subscript(bounds: CountableRange<Int>) -> String {
    let string = self[index(startIndex, offsetBy: bounds.lowerBound) ..< index(startIndex, offsetBy: bounds.upperBound)]
    return String(string)
  }
  
  public subscript(bounds: CountableClosedRange<Int>) -> String {
    let string = self[index(startIndex, offsetBy: bounds.lowerBound) ... index(startIndex, offsetBy: bounds.upperBound)]
    return String(string)
  }
  
  public subscript(index: Int) -> String {
    let character = self[self.index(startIndex, offsetBy: index)]
    return String(character)
  }
}
