//
//  RouteNode.swift
//  PathFindingTest
//
//  Created by samuel on 04/05/2017.
//
//

import Foundation
import SpriteKit

public let START: Int = 3
public let END: Int = 4

class RouteNode: Node {
    
    public var f: Int = 0
    public var h: Int = 0
    public var g: Int?
    
    public var shapeNode : SKShapeNode?
    
    init(node: Node) {
        
        super.init(type: node.type)
        
    }
    
    func refreshNodeFromNeighbourNode() {
        
        
    }
    
    
    
    
    class func StartNode() -> RouteNode {
        
        let result = RouteNode(node: Node(type:START))
        result.g = 0
        
        return result
    }
    
    class func EndNode() -> RouteNode {
        
        return RouteNode(node: Node(type:END))
    }
    
}
