//
//  MaxChunksToMakeSortedii.swift
//  数据结构与算法
//
//  Created by ChoiKarl on 2022/8/13.
//  Copyright © 2022 karl. All rights reserved.
//

/// https://leetcode.cn/problems/max-chunks-to-make-sorted-ii/
import Foundation

class MaxChunksToMakeSortedii: LeetCode {
    static func execute() {
        print(MaxChunksToMakeSortedii().maxChunksToSorted([2,1,5,2,3,4,8]))
    }
    
    
    /// 遍历数组,如果当前数字大于等于上一个数字,则当前数字可以当成一个块的开始.
    /// 如果当前数字小于上一个数字,则需要将当前数字与上一个块融合
    /// [2,1,5,2,1,4,8]
    /// list: [2]->[2]->[2,5]->[2,5]->[5]->[5]->[5,8]
    /// [2,1,5,2,3,4,8]
    /// list: [2]->[2]->[2,5]->[2,5]->[2,5]->[2,5]->[2,5,8]
    func maxChunksToSorted(_ arr: [Int]) -> Int {
        var list = [Int]()
        for item in arr {
            if list.isEmpty || list.last! <= item {
                list.append(item)
            } else {
                let max = list.removeLast()
                while list.isEmpty == false && list.last! > item {
                    list.removeLast()
                }
                list.append(max)
            }
        }
        return list.count
    }
}
