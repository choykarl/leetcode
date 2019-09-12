//
//  main.swift
//  数据结构与算法
//
//  Created by karl on 2019/07/07.
//  Copyright © 2019 karl. All rights reserved.
//

import Foundation




let list = LinkedList<String>()
list.insert("0", at: list.length) // 0
list.add("1") // 0, 1
list.insert("2", at: 0) // 2, 0, 1
list.remove(1) // 2, 1
list.set("3", at: 1) // 2, 3
list.add("4") // 2, 3, 4
list.insert("5", at: list.length - 1) // 2, 3, 5, 4
list.insert("6", at: 1) // 2, 6, 3, 5, 4
list.remove(0) // 6, 3, 5, 4
print(list.log(), list.index(2) as Any)

