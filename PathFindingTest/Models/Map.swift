//
//  Map.swift
//  PathFindingTest
//
//  Created by samuel on 04/05/2017.
//
//

import Foundation

struct Position {
    
    var x: Int
    var y: Int
}

enum MapError: Error {
    case spawnOutOfMap
    case targetOutOfMap
}

class Map {
    
    private var _name : String = ""
    
    public var name : String {
        get {
            return _name
        }
        set {
            _name = newValue
        }
    }
    
    private var mapNodes : [[RouteNode]]
    
    init(nodes : [[Node]], spawn: Position, target: Position) throws {
        
        mapNodes = nodes.map{ $0.map{ RouteNode(node: $0) } }
        
        do {
            
            guard (spawn.x < mapNodes.count && spawn.y < mapNodes[0].count) else {
                throw MapError.spawnOutOfMap
            }
            
            guard (target.x < mapNodes.count && target.y < mapNodes[0].count) else {
                throw MapError.targetOutOfMap
            }
            
            mapNodes[spawn.x][spawn.y] = RouteNode.StartNode()
            mapNodes[target.x][target.y] = RouteNode.EndNode()
        }
    }
    
    class func getMaps() -> [Map] {
        
        var maps : [Map] = []
        
        if let map = Map.buildFreeMap(dimension: 5, spawn: Position(x:1, y:3), target:Position(x:3, y:4)) {
            maps.append(map)
        }
        
        return maps
        
    }
    
    class func buildFreeMap(dimension: Int, spawn: Position, target: Position) -> Map? {
        
        let nodes = [[Node]](repeating:[Node](repeating:Node.FreeNode(), count:dimension), count:dimension)
        
        do {
            let map = try Map(nodes: nodes, spawn: spawn, target: target)
            map.name = "Free Zone"
            return map
        } catch {
            print("Position(s) incorrect(s)")
        }
        
        return nil
    }
    
}
