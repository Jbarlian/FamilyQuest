//
//  WheelPageVC.swift
//  Family Quest
//
//  Created by James Barlian on 10/06/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit


class WheelPageVC: UIViewController {
    
    var gameInfo: [String]?
    var gameScene: GameScene!
    var gameScene2: GameScene!
    var pemain:String = "Ha"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameScene = SKScene(fileNamed: "GameScene") as? GameScene
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                // Present the scene
                scene.userData = NSMutableDictionary()
                gameInfo = GameData.names
                scene.userData?.setObject(gameInfo ?? "", forKey: "gameInfo" as NSCopying)
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    @IBAction func nextPage(_ sender: Any) {
        if let vc = UIStoryboard(name: "ChallengePage", bundle: nil).instantiateViewController(withIdentifier: "ChallengePageVC") as? ChallengePageVC
        {
            vc.modalPresentationStyle = .fullScreen
            //present(vc, animated: true, completion: nil)
            if let navigator = navigationController {
            navigator.pushViewController(vc, animated: true)
            }
        }
        
    }
    
    @IBAction func stopButton(_ sender: Any) {
        print("Hello")
    }
    
    
    
}
