//
//  DesignAnOrderedStream.swift
//  数据结构与算法
//
//  Created by ChoiKarl on 2022/8/16.
//  Copyright © 2022 karl. All rights reserved.
//

/// https://leetcode.cn/problems/design-an-ordered-stream/
import Foundation

class DesignAnOrderedStream: LeetCode {
    static func execute() {
        let os = DesignAnOrderedStream(5)
        print(os.insert(3, "ccccc")); // 插入 (3, "ccccc")，返回 []
        print(os.insert(1, "aaaaa")); // 插入 (1, "aaaaa")，返回 ["aaaaa"]
        print(os.insert(2, "bbbbb")); // 插入 (2, "bbbbb")，返回 ["bbbbb", "ccccc"]
        print(os.insert(5, "eeeee")); // 插入 (5, "eeeee")，返回 []
        print(os.insert(4, "ddddd")); // 插入 (4, "ddddd")，返回 ["ddddd", "eeeee"]
    }
    
    
    var length = 0;
    var ptr = 1
    var list: [String?]
    init(_ n: Int) {
        length = n
        list = Array(repeating: nil, count: n + 1)
    }
        
    func insert(_ idKey: Int, _ value: String) -> [String] {
        list[idKey] = value
        var rtn = [String]()
        if (idKey == ptr) {
            for i in idKey ... length {
                if list[i] == nil {
                    ptr = i
                    break
                }
                rtn.append(list[i]!)
            }
        }
        
        return rtn
    }
}
