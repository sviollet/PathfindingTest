//
//  DetailViewController.swift
//  PathFindingTest
//
//  Created by samuel on 04/05/2017.
//
//

import UIKit
import SpriteKit
import GameplayKit

class DetailViewController: UIViewController {

    private var _scene : SKScene?
    
    var detailItem: Map? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
    var map: Map? {
        get {
            return detailItem
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detailItem = detailItem {
            navigationItem.title = detailItem.name
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
        
        if let view = self.view as! SKView? {
            
            _scene = SKScene(fileNamed: "MapScene")
            
            _scene?.scaleMode = SKSceneScaleMode.aspectFill
            
            
            displayMapDebug()
            
            // Present the scene
            view.presentScene(_scene)
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            
            
            
        }
        
        
        
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayMapDebug() -> Void {
        
        map?.nodes.map{ $0.map{ self.displayMapNode(routeNode: $0) } }
        
        map?.path.append((map?.nodes[1][1])!)
        
        map?.distanceToTarget(nodes: (map?.path)!)
    }
    
    func displayMapNode(routeNode :RouteNode) {
        
        let result = indicesOf(x: routeNode, array: (map?.nodes)!)
        
        if result != nil {
            let routeNode = map?.nodes[(result?.0)!][(result?.1)!]
            
            if routeNode != nil {
                
                routeNode!.shapeNode = convertToPosition(x: (result?.0)!, y: (result?.1)!)
                
                switch routeNode!.type {
                    
                case START :
                    routeNode!.shapeNode!.fillColor = SKColor.green
                    
                case END:
                    routeNode!.shapeNode!.fillColor = SKColor.red
                    
                default:
                    routeNode!.shapeNode!.fillColor = SKColor.lightGray
                }
                
                _scene?.addChild(routeNode!.shapeNode!)
            }
        }
    }
    
    func convertToPosition(x: Int, y: Int) -> SKShapeNode? {
        
        if (map != nil) {
            
            let width = (_scene?.frame.width)! / (map?.mapDimension?.width)!
            let height = (_scene?.frame.height)! / (map?.mapDimension?.height)!
            
            let node = SKShapeNode(rectOf: CGSize(width: width-10, height: height-10))
            
            node.fillColor = SKColor.green
            node.alpha = 0.4
            node.position = CGPoint(x: CGFloat(x+1) * width - width / 2, y: CGFloat(y+1) * height - (height / 2))
            return node
        }
        return nil
    }
    
    
}

