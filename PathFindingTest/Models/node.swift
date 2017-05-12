//
//  node.swift
//  PathFindingTest
//
//  Created by samuel on 04/05/2017.
//
//

import Foundation

fileprivate let FREE: Int = 0
fileprivate let BUSY: Int = 1


class Node : Equatable {
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    static func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs === rhs
    }
    
    private var _type: Int
    public var type: Int {
        
        get { return _type }
        set { _type = newValue }
    }
    
    init(type: Int) {
 
        _type = type
    }
    
    class func FreeNode() -> Node {
        
        return Node(type:FREE)
    }
    
    class func BusyNode() -> Node {
        
        return Node(type:BUSY)
    }
    
}
