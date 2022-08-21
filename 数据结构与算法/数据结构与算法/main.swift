//
//  main.swift
//  数据结构与算法
//
//  Created by karl on 2019/07/07.
//  Copyright © 2019 karl. All rights reserved.
//

import Foundation

//EvaluateReversePolishNotation.execute()

//LinkedList<String>.execute()

//TwoSum.execute()

//FibonacciNumber.execute()

//MergeTwoSortedLists.execute()

//DeleteNodeInALinkedList.execute()

//ReverseLinkedList.execute()

//InkedListCycle.execute()

//RemoveLinkedListElements.execute()

//MergeKSortedLists.execute()

//RemoveDuplicatesFromSortedList.execute()

//RemoveDuplicatesFromSortedList2.execute()

//MiddleOfTheLinkedList.execute()

//ValidateBinarySearchTree.execute()

//PalindromeLinkedList.execute()

//GetKthFromEnd.execute()

//RemoveNthFromEnd.execute()

//ValidParentheses.execute()

//MinStack.execute()

//DeleteLinkListAllData.execute()

//OrderlyQueue.execute()

//GenerateAStringWithCharactersThatHaveOddCounts.execute()

//MinimumSubsequenceInNonIncreasingOrder.execute()

//StringMatchingInAnArray.execute()

//ExclusiveTimeOfFunctions.execute()

//MinimumValueToGetPositiveStepByStepSum.execute()

//ReformatTheString.execute()

//GroupThePeopleGivenTheGroupSizeTheyBelongTo.execute()

//MaxChunksToMakeSortedii.execute()

//MaximumScoreAfterSplittingAString.execute()

//DesignCircularDeque.execute()

//DesignAnOrderedStream.execute()

//DeepestLeavesSum.execute()

//NumberOfStudentsDoingHomeworkAtAGivenTime.execute()

//MaximumBinaryTree.execute()

//CheckIfAWordOccursAsAPrefixOfAnyWordInASentence.execute()

let n1 = TreeNode(1)
let n2 = TreeNode(2)
let n3 = TreeNode(3)
let n4 = TreeNode(4)
let n5 = TreeNode(5)
let n6 = TreeNode(6)
let n7 = TreeNode(7)
let n8 = TreeNode(8)
let n9 = TreeNode(9)
let n10 = TreeNode(10)
let n11 = TreeNode(11)
let n12 = TreeNode(12)

n1.left = n2
n1.right = n3

n2.left = n4
n2.right = n5

n3.right = n6

n4.left = n7

n6.right = n8

n5.left = n9
n5.right = n10

n10.left = n11
n10.right = n12

print(n1.qxbl())
print(n1.zxbl())
print(n1.hxbl())
print(n1.cxbl().flatMap({$0}))
