//
//  GroupThePeopleGivenTheGroupSizeTheyBelongTo.swift
//  数据结构与算法
//
//  Created by ChoiKarl on 2022/8/12.
//  Copyright © 2022 karl. All rights reserved.
//
/// https://leetcode.cn/problems/group-the-people-given-the-group-size-they-belong-to/
import Foundation
class GroupThePeopleGivenTheGroupSizeTheyBelongTo: LeetCode {
    static func execute() {
        print(GroupThePeopleGivenTheGroupSizeTheyBelongTo().groupThePeople([2,1,3,3,3,2]))
    }
    
    /// 将数量一样的元素存到map里面,key是数量,value是数组,里面存放元素的下标
    /// 根据题目规则,如果数量是2,则map的value里的元素数量一定会是2的倍数.
    /// 此时只需要将map里的value,按照数量切成几个数组就可以.
    func groupThePeople1(_ groupSizes: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var map = [Int: [Int]]()
        for i in 0 ..< groupSizes.count {
            let item = groupSizes[i]
            if map[item] != nil {
                map[item]?.append(i)
            } else {
                map[item] = [i]
            }
            
        }
        
        map.forEach { key, value in
            if key == value.count {
                result.append(value)
            } else {
                var pre = 0
                for index in stride(from: 0, through: value.count, by: key) {
                    if index == 0 {
                        continue
                    }
                    let sub = value[pre ..< index]
                    result.append(Array(sub))
                    pre = index
                    print(sub)
                    
                }
            }
        }
        
        return result
    }
    
    /// 用map将数量不用的元素存储起来,将数量作为key,value是一个数组,数组里存放着各个元素的下标.
    /// 当数组里的元素数量==key时,则表示这一组已经存满了,则将这一组存到result里,然后从map里面移除这一组
    /// 等下次重新开一个新的数组重新存.
    func groupThePeople(_ groupSizes: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var map = [Int: [Int]]()
        for i in groupSizes.indices {
            let item = groupSizes[i]
            map[item, default: []].append(i)
            if map[item]!.count == item {
                result.append(map[item]!)
                map.removeValue(forKey: item)
            }
        }
        
        return result
    }
}
