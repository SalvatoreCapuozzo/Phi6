//
//  PhysicsBodyGenerator.swift
//  Phi6
//
//  Created by Gennaro Nappi on 05/02/17.
//  Copyright © 2017 ITNH. All rights reserved.
//

import SpriteKit

extension SKTexture
{
    func GetPixelColor(pos: CGPoint) -> UIColor
    {
        let pixelData = self.cgImage().dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let pixelInfo: Int = ((Int(self.size().width) * Int(pos.y)) + Int(pos.x)) * 4
        
        let r = CGFloat(data[pixelInfo + 0]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo + 1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo + 2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo + 3]) / CGFloat(255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}

/***
    @Descrizione: Data una texture, genera un SKPhysicsBody dei soli pixels che hanno un'alpha >= di alphaThreshold.
    @Params:
    -texture: La texture dalla quale generare il SKPhysicsBody;
    -alphaThreshold: Valore dell'alpha tale che un pixel sia considerato solido per l'algoritmo;
    -offset: Valore al quale riposizionare il SKPhysicsBody (in genere usato per impostare all'origine dello sprite la collision).
***/
func GeneratePhysicsBodyFrom(texture: SKTexture, alphaThreshold: CGFloat, offset: CGFloat = 0.0) -> SKPhysicsBody
{
    let path = CGMutablePath()
    var first: Bool = true
    let texSize = texture.size()
    var color: UIColor
    let minPoints = [CGPoint](), maxPoints = [CGPoint]()
    
    for y in 0..<Int(texSize.height)
    {
        for x in 0..<Int(texSize.width)
        {
            /*let point = CGPoint(x: x, y: y)
            let offsettedPoint = CGPoint(x: point.x - offset, y: -(point.y - offset))
            
            color = texture.GetPixelColor(pos: point)
            
            if color.cgColor.alpha >= alphaThreshold
            {
                if first
                {
                    path.move(to: offsettedPoint)
                    first = false
                }
                else
                {
                    path.addLine(to: offsettedPoint)
                }
            }*/
            
            let point = CGPoint(x: x, y: y)
            let offsettedPoint = CGPoint(x: point.x - offset, y: -(point.y - offset))
            
            color = texture.GetPixelColor(pos: point)
            
            if color.cgColor.alpha >= alphaThreshold
            {
                if first
                {
                    path.move(to: offsettedPoint)
                    first = false
                }
                else
                {
                    path.addLine(to: offsettedPoint)
                }
            }
        }
    }
    
    path.closeSubpath()
    
    return SKPhysicsBody(edgeLoopFrom: path)
}
