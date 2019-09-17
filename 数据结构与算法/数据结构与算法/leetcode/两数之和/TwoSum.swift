//
//  TwoSum.swift
//  数据结构与算法
//
//  Created by karl on 2019/09/16.
//  Copyright © 2019 karl. All rights reserved.
//

//  https://leetcode-cn.com/problems/two-sum/

import Foundation

class TwoSum: LeetCode {
    // 从数组中找到两个值相加等于target的索引.
    let array = [1, 3, 5, 12, 11, 9, 8]
    let target = 11
    
    // 用字典(哈希表)的方式效率搞一点
    // 每次遍历出来的值都用target去减一下,得到一个差,然后从字典里去找这个差,如果找到就直接将当前遍历的索引和从字典里找到的差的索引返回
    // 如果没有找到,就将当前遍历的值当作key,索引当作value存到字典里.
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for (i, num) in nums.enumerated() {
            let value = target - num
            if let index = dict[value] {
                return [i, index]
            }
            dict[num] = i;
        }
        return []
    }
    
    
    class func execute() {
        let ins = TwoSum();
        let result = TwoSum().twoSum(ins.array, ins.target)
        print(result)
    }

}
