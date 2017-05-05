//
//  RouteNode.swift
//  PathFindingTest
//
//  Created by samuel on 04/05/2017.
//
//

import Foundation

fileprivate let START: Int = 3
fileprivate let END: Int = 4

class RouteNode: Node {
    
    private var f: Int = 0
    private var h: Int = 0
    private var g: Int = 0
    
    init(node: Node) {
        
        super.init(type: node.type)
        
    }
    
    class func StartNode() -> RouteNode {
        
        return RouteNode(node: Node(type:START))
    }
    
    class func EndNode() -> RouteNode {
        
        return RouteNode(node: Node(type:END))
    }
    
}
