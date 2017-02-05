//
//  GameScene.swift
//  Phi6
//
//  Created by Salvatore Capuozzo on 24/01/2017.
//  Copyright © 2017 ITNH. All rights reserved.
//

import SpriteKit
import GameplayKit

enum CollisionCategories : UInt32
{
    case NONE = 0
    case PHISPHERE = 1
    case SOLID_TILE = 2
}

class GameScene: SKScene, SKPhysicsContactDelegate
{
    private var cam = SKCameraNode()
    private var testMap: TileMap!
    private var touchStartPos: CGPoint?
    private var touchEndPos: CGPoint?
    private var phiSphere: SKSpriteNode!
    private var startingPos = CGPoint(x: 30, y: 300)
    
    override init(size: CGSize)
    {
        super.init(size: size)
        
        //cam.position = CGPoint(x: 0, y: -200)
        //cam.setScale(0.5)
        
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -3)
        
        self.camera = cam
        self.addChild(cam)
        
        
    }
    
    func didBegin(_ contact: SKPhysicsContact)
    {
        let sphere: SKPhysicsBody
        let tile: SKPhysicsBody
        
        if contact.bodyA.node?.name == "PhiSphere"
        {
            sphere = contact.bodyA
            tile = contact.bodyB
        }
        else
        {
            tile = contact.bodyA
            sphere = contact.bodyB
        }
        
        //print(sphere.velocity)
        //sphere.node?.position = CGPoint(x: 10, y: 300)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func sceneDidLoad()
    {
        do
        {
            testMap = try TileMap(filename: "map_01")
            testMap.Render(self)
        }
        catch
        {
        }
        
        super.sceneDidLoad()
        
        print("asd \(testMap)")
        
        phiSphere = SKSpriteNode(imageNamed: "PhiSphere")
        phiSphere.name = "PhiSphere"
        phiSphere.position = startingPos
        phiSphere.size = CGSize(width: 32, height: 32)
        let spherePhysics = SKPhysicsBody(circleOfRadius: 16)
        spherePhysics.mass = 1
        //spherePhysics.friction = 0
        //spherePhysics.usesPreciseCollisionDetection = true
        spherePhysics.categoryBitMask = CollisionCategories.PHISPHERE.rawValue
        spherePhysics.collisionBitMask = CollisionCategories.SOLID_TILE.rawValue
        spherePhysics.contactTestBitMask = CollisionCategories.SOLID_TILE.rawValue
        phiSphere.physicsBody = spherePhysics
        
        let ground = SKSpriteNode(color: .red, size: CGSize(width: 512, height: 50))
        let groundPhy = SKPhysicsBody(rectangleOf: CGSize(width: 512, height: 50))
        ground.position = CGPoint(x: 100, y: -50)
        //ground.zRotation = 0.523599
        ground.physicsBody = groundPhy
        groundPhy.isDynamic = false
        
        //self.addChild(ground)
        self.addChild(phiSphere)
        
        //AddTriangle(x: 45, y: 150)
        //AddTriangle(x: 75, y: 120)
        
        //AddTexSlope(x: 45, y: 150, tex: SKTexture(rect: testMap.GetTileset().GetTileRect(225)!, in: SKTexture(image: #imageLiteral(resourceName: "minecraft"))))
        
        //AddTexSlope(x: 45, y: 150, tex: SKTexture(imageNamed: "minecraft_test.png"))
        
        //AddTexSlope(x: 45, y: 150, tex: SKTexture(imageNamed: "recdiocangolo.png"))
        
        
        
        /*************************/
        var path = CGMutablePath()
        path.move(to: CGPoint(x: 28, y: 33))
        path.addLine(to: CGPoint(x: 28, y: 193))
        path.addLine(to: CGPoint(x: 60, y: 192))
        path.addLine(to: CGPoint(x: 62, y: 33))
        path.addLine(to: CGPoint(x: 61, y: 191))
        path.addLine(to: CGPoint(x: 153, y: 98))
        path.addLine(to: CGPoint(x: 315, y: 96))
        path.addLine(to: CGPoint(x: 315, y: 193))
        path.addLine(to: CGPoint(x: 346, y: 192))
        path.addLine(to: CGPoint(x: 346, y: 34))
        path.closeSubpath()
        
        
        let coll = SKSpriteNode(color: .clear, size: CGSize(width: 512, height: 320))
        coll.position = CGPoint(x: -45, y: -48)
        let collPhy = SKPhysicsBody(edgeLoopFrom: path)
        collPhy.categoryBitMask = CollisionCategories.SOLID_TILE.rawValue
        collPhy.collisionBitMask = CollisionCategories.PHISPHERE.rawValue
        
        coll.physicsBody = collPhy
        //addChild(coll)
    }
    
    func AddTriangle(x: Int, y: Int)
    {
        let triangleImg = UIImage(named: "Triangle.png")
        let triangleTex = SKTexture(image: triangleImg!)
        let subTri = SKTexture(rect: CGRect(x: 0.25, y: 0.25, width: 0.5, height: 0.5), in: triangleTex)
        let triangle = SKSpriteNode(texture: triangleTex)
        triangle.size = CGSize(width: 250, height: 150)
        triangle.position = CGPoint(x: x, y: y)
        let trianglePhy = SKPhysicsBody(texture: triangleTex, size: triangle.size)
        trianglePhy.isDynamic = false
        trianglePhy.categoryBitMask = CollisionCategories.SOLID_TILE.rawValue
        trianglePhy.collisionBitMask = CollisionCategories.PHISPHERE.rawValue
        triangle.physicsBody = trianglePhy
        
        self.addChild(triangle)
    }
    
    func AddTexSlope(x: Int, y: Int, tex: SKTexture)
    {
        let slopeImg = UIImage(named: "minecraft_test.png")
        let slope = SKSpriteNode(texture: SKTexture(image: slopeImg!))
        slope.size = CGSize(width: 32, height: 32)
        slope.position = CGPoint(x: x, y: y)
        
        let slopePath = CGMutablePath()
        var first: Bool = true
        
        print("... SLOPE PIXEL DATA ...")
        var color: UIColor
        let offset: CGFloat = 16
        
        /*for y in 0..<33
        {
            for x in 0..<32
            {
                let point = CGPoint(x: x, y: y)
                let offsettedPoint = CGPoint(x: point.x - offset, y: -(point.y - offset))
                color = (slopeImg?.cgImage?.GetPixelColor(pos: point, size: CGSize(width: 32, height: 32)))!
                
                if color.cgColor.alpha >= 0.5
                {
                    if first
                    {
                        slopePath.move(to: offsettedPoint)
                        first = false
                    }
                    else
                    {
                        slopePath.addLine(to: offsettedPoint)
                    }
                }
                
                print(x, y, color, color.cgColor.alpha)
            }
        }
        slopePath.closeSubpath()*/
        
        let slopePhy = SKPhysicsBody(edgeLoopFrom: slopePath)
        slopePhy.isDynamic = false
        slopePhy.categoryBitMask = CollisionCategories.SOLID_TILE.rawValue
        slopePhy.collisionBitMask = CollisionCategories.PHISPHERE.rawValue
        slope.physicsBody = slopePhy
        
        self.addChild(slope)
    }
    
    /*func AddTexSlope2(x: Int, y: Int)
    {
        let slopeTex = SKTexture(imageNamed: "minecraft_test.png")
        
        let slope = SKSpriteNode(texture: slopeTex)
        slope.size = CGSize(width: 250, height: 150)
        slope.position = CGPoint(x: x, y: y)
        let slopePhy = SKPhysicsBody(texture: slopeTex, size: slope.size)
        slopePhy.isDynamic = false
        slopePhy.categoryBitMask = CollisionCategories.SOLID_TILE.rawValue
        slopePhy.collisionBitMask = CollisionCategories.PHISPHERE.rawValue
        slope.physicsBody = slopePhy
        
        self.addChild(slope)
    }*/
    
    func ResetSimulation()
    {
        phiSphere.position = startingPos
        phiSphere.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        phiSphere.physicsBody?.angularVelocity = 0
    }
    
    override func update(_ currentTime: TimeInterval)
    {
        //self.update(currentTime)
        
        /*if let start = touchStartPos, let end = touchEndPos
        {
            if self.camera?.position != end
            {
                self.camera?.position = CGPoint(x: (self.camera?.position.x)! + 5.25, y: (self.camera?.position.y)! + 5.25)
            }
        }*/
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        touchStartPos = touches.first?.location(in: self)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.camera?.position = touches.first!.location(in: self)
        //print(camera?.position)
        touchEndPos = touches.first?.location(in: self)
    }
}
