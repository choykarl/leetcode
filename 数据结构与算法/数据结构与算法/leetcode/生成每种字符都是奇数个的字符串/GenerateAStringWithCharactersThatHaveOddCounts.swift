//
//  GenerateAStringWithCharactersThatHaveOddCounts.swift
//  数据结构与算法
//
//  Created by ChoiKarl on 2022/8/3.
//  Copyright © 2022 karl. All rights reserved.
//


/// https://leetcode.cn/problems/generate-a-string-with-characters-that-have-odd-counts/
import Foundation

class GenerateAStringWithCharactersThatHaveOddCounts: LeetCode {
    static func execute() {
        print(GenerateAStringWithCharactersThatHaveOddCounts().generateTheString(12))
    }
    
    func generateTheString(_ n: Int) -> String {
        /// 是奇数,就直接生成奇数个相同的字符
        /// 是偶数,就用偶数生成两个奇数
        if (n % 2 == 1) {
            return String(repeating: "a", count: n)
        } else {
            return String(repeating: "a", count: n - 1) + "b"
        }
    }
}
