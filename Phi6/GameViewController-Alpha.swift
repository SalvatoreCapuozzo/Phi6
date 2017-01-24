//
//  GameViewController-Alpha.swift
//  Phi6
//
//  Created by Salvatore Capuozzo on 24/01/2017.
//  Copyright © 2017 ITNH. All rights reserved.
//

/*
import UIKit
import SpriteKit
import GameplayKit
import VerticalSlider

class GameViewController: UIViewController {
    
    @IBOutlet weak var pauseButton: UIButton!
    var scene: GameScene!
    
    @IBOutlet weak var widthSlider: UISlider!
    @IBOutlet weak var widthLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    
    
    @IBOutlet var diameterSlider: VerticalSlider!
    @IBOutlet weak var diameterLabel: UILabel!
    
    @IBOutlet weak var objectListView: ObjectTableViewController!
    // Da inserire programmaticamente come menù degli oggetti
    /*
     Gli oggetti del menù sono:
     - Simple Objects
     - Linkers
     - Simple Machines
     - Vectors
     - Sensors
     - Special Objects
     
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = GameScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                self.scene = scene
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
        
        setWidth()
        setHeight()
        setDiameter()
        diameterSlider.slider.addTarget(self, action: #selector(setDiameter), for: .valueChanged)
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .landscape
        } else {
            return .landscape
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    @IBAction func pressPlay(_ sender: UIButton) {
        if scene.isStopped() {
            scene.play()
            pauseButton?.setTitle("Reset", for: UIControlState(rawValue: 0))
        } else {
            scene.stop()
            pauseButton?.setTitle("Play", for: UIControlState(rawValue: 0))
            widthSlider.value = Float(scene.pauseTriangleWidth)
            widthLabel.text! = String(describing: round(scene.pauseTriangleWidth*10)/10) + " m"
            heightSlider.value = Float(scene.pauseTriangleHeight)
            heightLabel.text! = String(describing: round(scene.pauseTriangleHeight*10)/10) + " m"
            diameterSlider.value = Float(scene.pauseDiameter)
            diameterLabel.text! = String(describing: round(scene.pauseDiameter*10)/10)
        }
        
    }
    
    @IBAction func setWidth() {
        scene.triangle.position.x = scene.triangle.position.x - (scene.triangle.size.width - CGFloat(widthSlider.value))/2
        scene.triangle.size.width = CGFloat(widthSlider.value)
        widthLabel.text! = String(describing: round(scene.triangle.size.width*10)/10) + " m"
    }
    
    @IBAction func setHeight() {
        scene.triangle.position.y = scene.triangle.position.y - (scene.triangle.size.height - CGFloat(heightSlider.value))/2
        scene.triangle.size.height = CGFloat(heightSlider.value)
        heightLabel.text! = String(describing: round(scene.triangle.size.height*10)/10) + " m"
        //scene.triangle.physicsBody?.collisionBitMask.
        
    }
    
    @IBAction func setDiameter() {
        scene.phisphere.position.x = scene.phisphere.position.x - (scene.phisphere.size.width - CGFloat(diameterSlider.value))/2
        scene.phisphere.size.width = CGFloat(diameterSlider.value)
        scene.phisphere.position.y = scene.phisphere.position.y - (scene.phisphere.size.height - CGFloat(diameterSlider.value))/2
        scene.phisphere.size.height = CGFloat(diameterSlider.value)
        diameterLabel.text! = String(describing: round(scene.phisphere.size.width*10)/10)
        
    }
    @IBAction func addTriangle() {
        scene.addTriangle()
    }
    
    
    @IBAction func showObjects(_ sender: Any) {
        // self.showPausedMenu()
        
    }
}
*/
