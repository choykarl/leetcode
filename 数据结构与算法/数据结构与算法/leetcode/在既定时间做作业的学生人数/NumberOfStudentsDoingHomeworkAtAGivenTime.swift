//
//  NumberOfStudentsDoingHomeworkAtAGivenTime.swift
//  数据结构与算法
//
//  Created by ChoiKarl on 2022/8/19.
//  Copyright © 2022 karl. All rights reserved.
//
/// https://leetcode.cn/problems/number-of-students-doing-homework-at-a-given-time/
import Foundation
class NumberOfStudentsDoingHomeworkAtAGivenTime: LeetCode {
    static func execute() {
        print(NumberOfStudentsDoingHomeworkAtAGivenTime().busyStudent([9,8,7,6,5,4,3,2,1], [10,10,10,10,10,10,10,10,10], 5))
    }
    
    func busyStudent(_ startTime: [Int], _ endTime: [Int], _ queryTime: Int) -> Int {
        var rtn = 0
        for i in 0 ..< startTime.count {
            if startTime[i] <= queryTime && endTime[i] >= queryTime {
                rtn += 1
            }
        }
        return rtn
    }
}
