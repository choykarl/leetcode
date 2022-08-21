//
//  CheckIfAWordOccursAsAPrefixOfAnyWordInASentence.swift
//  数据结构与算法
//
//  Created by ChoiKarl on 2022/8/21.
//  Copyright © 2022 karl. All rights reserved.
//

/// https://leetcode.cn/problems/check-if-a-word-occurs-as-a-prefix-of-any-word-in-a-sentence/
import Foundation
class CheckIfAWordOccursAsAPrefixOfAnyWordInASentence: LeetCode {
    static func execute() {
        print(CheckIfAWordOccursAsAPrefixOfAnyWordInASentence().isPrefixOfWord("this problem is an easy problem", "aa"))
    }
    
    func isPrefixOfWord(_ sentence: String, _ searchWord: String) -> Int {
        var index = -1;
        let stringList = sentence.split(separator: " ")
        for i in 0 ..< stringList.count {
            if stringList[i].hasPrefix(searchWord) {
                index = i + 1
                break
            }
        }
        return index
    }
}
