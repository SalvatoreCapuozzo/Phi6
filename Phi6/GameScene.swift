//
//  GameScene.swift
//  Phi6
//
//  Created by Salvatore Capuozzo on 24/01/2017.
//  Copyright © 2017 ITNH. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene
{
    private var cam = SKCameraNode()
    private var testMap: TileMap?
    
    override init(size: CGSize)
    {
        super.init(size: size)
        
        //cam.position = CGPoint(x: 0, y: -200)
        //cam.setScale(0.5)
        
        self.camera = cam
        self.addChild(cam)
        
        do
        {
            testMap = try TileMap(filename: "map_00")
            testMap?.Render(self)
        }
        catch
        {
            
        }
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func sceneDidLoad()
    {
        super.sceneDidLoad()
        
        /*let tileset = Tileset(name: "pkmn_tileset", tSize: 16)
        /*addChild(Tile(tSet: tileset, pos: CGPoint(x: 100, y: 100), id: 0))
        addChild(Tile(tSet: tileset, pos: CGPoint(x: 116, y: 100), id: 1))
        addChild(Tile(tSet: tileset, pos: CGPoint(x: 132, y: 100), id: 2))*/
        
        var currentIndex = 0
        var x = 0
        var y = 0
        var keepAdding: Bool = true
        
        while(y < Int(tileset.GetTextureAtlas().size().height) && keepAdding)
        {
            x = 0
            
            while(x < Int(tileset.GetTextureAtlas().size().width) && keepAdding)
            {
                addChild(Tile(tSet: tileset, pos: CGPoint(x: CGFloat(x), y: self.frame.maxY - CGFloat(y)), id: currentIndex))
                
                x += 16
                currentIndex += 1
                
                if currentIndex > tileset.GetNumberOfTiles()
                {
                    keepAdding = false
                }
            }
            
            y += 16
        }*/
        
        /*
        let tile0 = SKSpriteNode(texture: SKTexture(rect: tileset.GetTileRect(0)!, in: tileset.GetTextureAtlas()))
        tile0.position = CGPoint(x: 10, y: 10)
        tile0.size = CGSize(width: 32, height: 32)
        addChild(tile0)*/
    }
    
    override func update(_ currentTime: TimeInterval)
    {
        //self.update(currentTime)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.camera?.position = touches.first!.location(in: self)
        print(camera?.position)
    }
}
