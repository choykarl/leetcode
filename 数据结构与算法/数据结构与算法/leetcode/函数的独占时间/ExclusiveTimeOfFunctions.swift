//
//  ExclusiveTimeOfFunctions.swift
//  数据结构与算法
//
//  Created by ChoiKarl on 2022/8/8.
//  Copyright © 2022 karl. All rights reserved.
//

/// https://leetcode.cn/problems/exclusive-time-of-functions/
import Foundation
class ExclusiveTimeOfFunctions: LeetCode {
    static func execute() {
        print(ExclusiveTimeOfFunctions().exclusiveTime(3, ["0:start:0","1:start:2","2:start:5","2:end:6","1:end:8","0:end:9"]))
    }
    
    func exclusiveTime(_ n: Int, _ logs: [String]) -> [Int] {
        
        var ans = Array(repeating: 0, count: n)
        var stack = [Int]()
        
        var cur = 0
        for i in 0 ..< logs.count {
            let split = logs[i].split(separator: ":")
            let id = Int(split.first!)!
            let type = split[1]
            let timestamp = Int(split.last!)!
            if type == "start" {
                if !stack.isEmpty {
                    let top = stack.last!;
                    ans[top] += timestamp - cur;
                }
                stack.append(id)
                cur = timestamp
            } else {
                let top = stack.removeLast();
                ans[top] += timestamp - cur + 1;
                cur = timestamp + 1;
            }
        }
        return ans
    }
}

