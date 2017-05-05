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


class Node {
    
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
