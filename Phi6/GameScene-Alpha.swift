//
//  GameScene-Alpha.swift
//  Phi6
//
//  Created by Salvatore Capuozzo on 24/01/2017.
//  Copyright © 2017 ITNH. All rights reserved.
//

/*
import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var phisphere: SKSpriteNode!
    var triangle: SKSpriteNode!
    var block: SKSpriteNode!
    var numTriangle: Int = 0
    var arrayTriangle: Array<SKSpriteNode> = Array<Any>(repeating: SKSpriteNode(), count: 100) as! Array<SKSpriteNode>
    
    let triangleTexture = SKTexture(imageNamed: "Triangle")
    
    var triangleClass = Triangle()
    
    var pausePosition: CGPoint!
    var pauseDiameter: CGFloat!
    var pauseTriangleWidth: CGFloat!
    var pauseTriangleHeight: CGFloat!
    var pauseTrianglePos: CGPoint!
    var pauseBlockPos: CGPoint!
    var pause = true
    
    var triangle2: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        
        phisphere = childNode(withName: "phisphere") as! SKSpriteNode
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        pausePosition = phisphere.position
        pauseDiameter = phisphere.size.width
        
        triangle = childNode(withName: "triangle") as! SKSpriteNode
        pauseTriangleWidth = triangle.size.width
        pauseTriangleHeight = triangle.size.height
        pauseTrianglePos = triangle.position
        
        block = childNode(withName: "block") as! SKSpriteNode
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        pauseBlockPos = block.position
        
        Singleton.shared.createList()
        
        if Singleton.shared.selectedPath != IndexPath() {
            switch Singleton.shared.selectedPath {
            case [0, 0]:
                addTriangle()
            case [0, 1]:
                addRectangle()
            case [0, 2]:
                addCircle()
            default: print("Oops, something went wrong")
            }
        }
        
        addTriangle()
        //triangle2 = childNode(withName: "triangle") as! SKSpriteNode
        //triangle2.position = CGPoint(x: frame.maxX/2, y: frame.maxY/2)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if pause {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchedWhere = nodes(at: touchLocation)
                
                if !touchedWhere.isEmpty {
                    for node in touchedWhere {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == phisphere {
                                phisphere.position = touchLocation
                            } else if sprite == triangle {
                                triangle.position = touchLocation
                                
                                //triangle.size.height += 20
                                //triangle.position.y += 10
                                
                            } else {
                                for object in Singleton.shared.objects {
                                    if sprite == object {
                                        object.position = touchLocation
                                    }
                                }
                            }
                        }
                    }
                }
            }
            // Funzione utile per aggiungere oggetti
            /*
             for touch: AnyObject in touches {
             let sprite = TriangleNode.triangle(location: touch.location(in: self))
             self.addChild(sprite)
             }
             */
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if pause {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchedWhere = nodes(at: touchLocation)
                
                if !touchedWhere.isEmpty {
                    for node in touchedWhere {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == phisphere {
                                phisphere.position = touchLocation
                            } else if sprite == triangle {
                                triangle.position = touchLocation
                                //triangle.size.height += 20
                                //triangle.position.y += 10
                                
                            } else {
                                for object in Singleton.shared.objects {
                                    if sprite == object {
                                        object.position = touchLocation
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        if !pause {
            phisphere.physicsBody?.affectedByGravity = true
            for object in Singleton.shared.objects {
                object.physicsBody?.affectedByGravity = true
            }
        }
    }
    
    func play() {
        self.pause = false
    }
    
    func stop() {
        self.pause = true
        reset()
    }
    
    func isStopped() -> Bool {
        if self.pause == true {
            return true
        } else {
            return false
        }
    }
    
    func reset() {
        phisphere.physicsBody?.affectedByGravity = false
        phisphere.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        phisphere.physicsBody?.angularVelocity = 0
        phisphere.position = pausePosition
        phisphere.zRotation = 0
        phisphere.size.width = pauseDiameter
        phisphere.size.height = pauseDiameter
        triangle.size.width = pauseTriangleWidth
        triangle.size.height = pauseTriangleHeight
        triangle.position = pauseTrianglePos
        block.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        block.physicsBody?.angularVelocity = 0
        block.position = pauseBlockPos
        block.zRotation = 0
    }
    /*
     func addTriangle() {
     /*
     var triangle = Triangle()
     triangle.node.size.width = 50
     triangle.node.size.height = 50
     triangle.node.position = CGPoint(x: 100, y: 50)
     triangle.node.zPosition = 0
     physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
     triangle.node.physicsBody?.affectedByGravity = true
     triangle.node.physicsBody?.isDynamic = true
     triangle.node.physicsBody?.mass = 1
     triangle.node.physicsBody?.collisionBitMask = 4294967295
     triangle.node.physicsBody?.fieldBitMask = 4294967295
     triangle.node.physicsBody?.categoryBitMask = 4294967295
     Singleton.shared.addNewObject(anObject: triangle)
     addChild(triangle.node)
     */
     let sprite = TriangleNode.triangle(location: CGPoint(x: 100, y: 50))
     Singleton.shared.addNewObject(anObject: sprite)
     self.addChild(sprite)
     }
     */
    func addTriangle() {
        let sprite = TriangleNode.triangle(location: CGPoint(x: frame.maxX/2, y: frame.maxY/2))
        Singleton.shared.addNewObject(anObject: sprite)
        self.addChild(sprite)
    }
    
    func addRectangle() {
        let sprite = RectangleNode.rectangle(location: CGPoint(x: 100, y: 50))
        Singleton.shared.addNewObject(anObject: sprite)
        self.addChild(sprite)
    }
    
    func addCircle() {
        let sprite = CircleNode.circle(location: CGPoint(x: 100, y: 50))
        Singleton.shared.addNewObject(anObject: sprite)
        self.addChild(sprite)
    }
}
*/
