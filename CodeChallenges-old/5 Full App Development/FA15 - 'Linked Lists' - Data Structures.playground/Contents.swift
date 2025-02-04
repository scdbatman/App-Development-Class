//  🏔️ MTECH Code Challenge SD15: "Linked Lists"
//  Concept: Learn about a specialized data structure; build understanding of the systems underlying standard code structures

//  Instructions:
    //  Today's code challenge will take the form of a mini-lesson led by your instructor. Follow along in the space below.

//  Notes:
    //  If you were not present for the in class demonstration, follow along with the demonstration here: 🔗https://swiftbyshanks.medium.com/stack-and-queue-implementation-with-linkedlist-in-swift-b16c69e1e0dc

import Foundation

class ListNode<T> {
    var value: T
    
    var next: ListNode?
    
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    var head: ListNode<T>?
    
    func push(value: T) {
        let node = ListNode<T>(value: value)
        
        if let head {
            node.next = head
            self.head = node
        } else {
            head = node
        }
    }
    
    func pop() -> ListNode<T>? {
        if let headNode = head {
            let oldHead = headNode
            head = headNode.next
            oldHead.next = nil
            return oldHead
        } else {
            return nil
        }
    }
    
    func peek() -> ListNode<T>? {
        return head
    }
}
