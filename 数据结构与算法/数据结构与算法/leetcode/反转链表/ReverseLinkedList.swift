//
//  ReverseLinkedList.swift
//  数据结构与算法
//
//  Created by 蔡浩浩 on 2019/9/18.
//  Copyright © 2019 karl. All rights reserved.
//

// https://leetcode-cn.com/problems/reverse-linked-list/
import Foundation

class ReverseLinkedList: LeetCode {
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard var head = head else {return nil}
        if head.next == nil {
            return head
        }
        
        var stack = [ListNode]()
        
        /*
         因为while循环的条件是head.next不能为nil,所以只能遍历到倒数第二个节点
         遍历到最后相当于把倒数第二个节点的的next指向head,所以head就成了最后一个节点,也就是反转完以后的头节点.
         
         按顺序存到栈里,然后将栈从后往前一个一个取出来,就相当于反转.
         */
        while head.next != nil {
            // 先记录住next,然后清除之前的next指向
            let next = head.next!
            head.next = nil
            
            stack.append(head)
            head = next
        }
        
        // 先取出栈里面的最后一个,栈里的最后一个就是之前链表的倒数第二个,也是反转后的第二个节点,由头结点的next先指向.
        var tmp: ListNode? = stack.removeLast()
        head.next = tmp
        
        // 将栈里面的所有节点从后往前依次取出.
        while stack.count > 0 {
            let node = stack.removeLast()
            tmp?.next = node;
            tmp = tmp?.next
        }
        
        return head
    }
    
    /*
     通过画图去了解,更加直观和好理解!!!
     
     因为是反转,需要先让原本的head.next指向nil,但又不能让之前的head.next指向的第二个节点没有指针指向,导致断了,就需要创建临时变量先去记住之前的head.next
     tmpNode1 = tmpHead?.next // 临时指针先指向之前的第二个
     tmpHead?.next = tmpNode2 // head.next指向nil
     
     因为每次循环tmpNode1都要等于tmpHead?.next,所以tmpHead需要往后走,这样整个循环才能往下走下去.
     所以tmpHead需要指向第二个节点,也就是现在的tmpNode1
     但是tmpHead指向第二个节点以后,第一个节点就没指针指向了,也就会断了,这样第二个节点反转的时候就找不到第一个节点了,所以这个时候用tmpNode2先去指向.
     tmpNode2 = tmpHead // 先记住第一个节点,第二个节点反转的时候能够找到
     tmpHead = tmpNode1 // tmpHead往后走
     */
    func reverseList2(_ head: ListNode?) -> ListNode? {
        if head == nil {return nil}
        if head!.next == nil {
            return head
        }
        
        var tmpHead = head
        var tmpNode1: ListNode? = nil
        var tmpNode2: ListNode? = nil
        
        while tmpHead != nil {
            tmpNode1 = tmpHead?.next
            tmpHead?.next = tmpNode2
            tmpNode2 = tmpHead
            tmpHead = tmpNode1
        }
        
        return tmpNode2
    }
    
    func reverseList3(head: ListNode?) -> ListNode? {
        if head == nil {return nil}
        if head!.next == nil {
            return head
        }
        var move = head
        var pre: ListNode?
        while move != nil {
            let next = move?.next
            move?.next = pre
            pre = move
            move = next
        }
        
        return pre
    }
    
    static func execute() {
        let node = ListNode(1)
        let node1 = ListNode(3)
        let node2 = ListNode(5)
        let node3 = ListNode(7)
        
        node.next = node1
        node1.next = node2
        node2.next = node3
        
        let ins = ReverseLinkedList()
//        let result = ins.reverseList2(node)
        let result = ins.reverseList3(head: node)
        print(result!.log())
    }
}
