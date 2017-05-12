//
//  Map.swift
//  PathFindingTest
//
//  Created by samuel on 04/05/2017.
//
//

import UIKit
import Foundation
import SpriteKit

struct Position {
    
    var x: Int
    var y: Int
}

enum MapError: Error {
    case spawnOutOfMap
    case targetOutOfMap
}


class MapDimension : NSObject {
    
    var width : CGFloat {
        get {
            return CGFloat(nodes[0].count)
        }
    }
    var height : CGFloat {
        get {
            return CGFloat(nodes.count)
        }
    }
    
    private var nodes : [[RouteNode]]
    
    init(map : Map) {
        self.nodes = map.nodes
    }
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
    
    public var nodes : [[RouteNode]] {
        get {
            return mapNodes
        }
    }
    
    public var mapDimension : MapDimension?
    
    public var path : [RouteNode] = []
    
    init(nodes : [[Node]], spawn: Position, target: Position) throws {
        
        mapNodes = nodes.map{ $0.map{ RouteNode(node: $0) } }
        
        mapDimension = MapDimension(map: self)
        
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
    
    func distanceToTarget(nodes : [RouteNode]) {
        
        // récupérer noeud voisin -> [Node] (getNeighbourNode)
        /*
        let result = self.mapNodes.filter ({(data:[RouteNode]) -> Bool in
            
            return data.filter ({(node: RouteNode) -> Bool in
                return node.g == 0
            }).count > 0
        })*/
        
        /*
        nodes.enumerated().map {
            print (($0).element.g)
        }*/
        
        
        let test = self.mapNodes.enumerated().map {
            
            $0.element.filter{
                
                $0.g == 0
                
            }
            
        }
        
        
        /*
        var nodes = nodes
        nodes.map{ ( node : [RouteNode]) -> Int in
            
            return 1
        
        }*/
        /*
        let result1 = self.mapNodes.filter ({(data:[RouteNode]) -> Bool in
            
            return data.filter ({ $0.g == 0}).count > 0
        })*/
        /*
        if (result.count != 0) {
                nodes.map{self.distanceToTarget(nodes: self.getNeighbourNode(node: $0, distance: 1))}
        } else {
            print ("fin")
        }*/
        
        
        
        //let routeNodes = getNeighbourNode(node: path.last!, distance: 1)
        
        //routeNodes.map{ analyzeNode(node: $0) }

        // regarder noeud voisin
            // incrémenter les vecteurs
                // si même x et / ou même y +10
                // sinon +14
        // vérifier si target présente
        
        // oui
        
            // fin
        
        // non
        
            // on vérifier les voisins +1
        
    }
    
    func getNeighbourNode(node: RouteNode, distance: Int) -> [RouteNode] {
        
        var result : [RouteNode] = []
        
        // récupérer indices du node
        let position = indicesOf(x: node, array: nodes)
        
        if position != nil {
            
            // appliquer distance
            for x in -distance...distance {
                
                for y in -distance...distance {
                    
                    do {
                        
                        if (abs(x) == abs(distance) || abs(y) == abs(distance)) {
                            
                            
                            if (((position?.0)! + x) >= 0 && ((position?.1)! + y) >= 0) {
                                
                                let nodeToScan = nodes[(position?.0)! + x][(position?.1)! + y]
                                result.append(nodeToScan)
                                
                                var newG = 10
                                
                                if (abs(x) == abs(distance) && abs(y) == abs(distance)) {
                                    newG = 14
                                }
                                
                                if (nodeToScan.g == nil) {
                                    nodeToScan.g = node.g! + newG
                                } else if (node.g! + newG < nodeToScan.g!) {
                                    nodeToScan.g = node.g! + newG
                                }
                                
                                analyzeNode(node: nodeToScan)
                                
                            }
                        }
                        
                    } catch {
                        print("erreur")
                    }
                }
            }
        }
        // retourner liste des noeuds se trouvant à cette distance (attention pointeur et non pas copie !)
        return result
    }
    
    func analyzeNode(node: RouteNode) {
        
        node.shapeNode!.fillColor = SKColor.blue
        //node.g =
        
    }
    
    class func getMaps() -> [Map] {
        
        var maps : [Map] = []
        
        if let map = Map.buildFreeMap(dimension: 5, spawn: Position(x:1, y:1), target:Position(x:2, y:2)) {
            maps.append(map)
        }
        
        return maps
        
    }
    
    private class func buildFreeMap(dimension: Int, spawn: Position, target: Position) -> Map? {
        
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
