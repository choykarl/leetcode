//
//  OrderlyQueue.swift
//  数据结构与算法
//
//  Created by ChoiKarl on 2022/8/3.
//  Copyright © 2022 karl. All rights reserved.
//

/// https://leetcode.cn/problems/orderly-queue/

import Foundation

class OrderlyQueue: LeetCode {
    static func execute() {
        print(OrderlyQueue().orderlyQueue("aqbsjdaj", 2))
    }
    
    /// 只需要考虑两种情况,一种是当k==1时,另外一种是k>1时.
    /// 当k > 1时,s字符串则会产生任意多种排序方式.这时只需要将字符串s升序排序就会得到想要的字符串.
    /// 当k == 1时,则每次只能移动头部的一个字符放到尾部,就需要遍历字符串,对比每一次移动后的大小,然后获取最小的字符串.
    func orderlyQueue(_ s: String, _ k: Int) -> String {
        if k == 1 {
            var cChar = Array(s)
            var minSring = s
            for _ in s {
                cChar.append(cChar.removeFirst())
                let tmpString = String(cChar)
                if tmpString < minSring {
                    minSring = tmpString
                }
            }
            return minSring
        } else {
            return String(s.sorted())
        }
    }
}
