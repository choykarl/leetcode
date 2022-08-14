//
//  ReformatTheString.swift
//  数据结构与算法
//
//  Created by ChoiKarl on 2022/8/11.
//  Copyright © 2022 karl. All rights reserved.
//

/// https://leetcode.cn/problems/reformat-the-string/
import Foundation
class ReformatTheString: LeetCode {
    static func execute() {
        print(ReformatTheString().reformat("covid2019"))
    }
    
    func reformat(_ s: String) -> String {
        // 将数字和字母分别用数组保存
        var nums = [Character]()
        var words = [Character]()
        for word in s {
            
            if word.isNumber {
                nums.append(word)
            } else {
                words.append(word)
            }
        }
        
        // 不符合标准
        if abs(nums.count - words.count) > 1 {
            return ""
        }
        
        /// 判断哪个数组长,数字数组长就优先用数字,其他情况优先用字母
        let maxCount = max(nums.count, words.count)
        let numCountIsMax = nums.count > words.count
        var result = ""
        for i in 0 ..< maxCount {
            if numCountIsMax {
                result.append(nums[i])
                if i < words.count {
                    result.append(words[i])
                }
                
            } else {
                result.append(words[i])
                if i < nums.count {
                    result.append(nums[i])
                }
            }
            
        }
        
        return result
    }
}
