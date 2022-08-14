//
//  StringMatchingInAnArray.swift
//  数据结构与算法
//
//  Created by ChoiKarl on 2022/8/6.
//  Copyright © 2022 karl. All rights reserved.
//

/// https://leetcode.cn/problems/string-matching-in-an-array/
import Foundation
class StringMatchingInAnArray: LeetCode {
    static func execute() {
        print(StringMatchingInAnArray().stringMatching(["blue","green","bu"]))
    }
    
    /// 解题思路:
    /// 1.先将原始字符串数组按长短从小到大排序,这样就只需要从前往后比较就行了,越往后就比较的越少
    /// 2.比较到有符合的加到result数组里,就可以break出循环
    func stringMatching(_ words: [String]) -> [String] {
        var result = [String]()
        let sortedWords = words.sorted(by: {$0.count < $1.count})
        for i in 0 ..< sortedWords.count {
            let iWord = sortedWords[i]
            // 只需要跟下一个比较
            for j in i + 1 ..< sortedWords.count {
                let jWord = sortedWords[j]
                if jWord.contains(iWord) {
                    result.append(iWord)
                    break
                }
            }
        }
        return result
    }
}
