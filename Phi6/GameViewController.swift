//
//  GameViewController.swift
//  Phi6
//
//  Created by Salvatore Capuozzo on 24/01/2017.
//  Copyright © 2017 ITNH. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController
{
    private var scene: GameScene!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        scene = GameScene(size: view.frame.size)
        scene.scaleMode = .resizeFill
        
        if let view = self.view as! SKView?
        {
            view.presentScene(scene)
            view.ignoresSiblingOrder = true
            // Shows the various physics boundings of objects
            view.showsPhysics = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool
    {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func ResetPressed(_ sender: UIButton)
    {
        scene.ResetSimulation()
    }
}
