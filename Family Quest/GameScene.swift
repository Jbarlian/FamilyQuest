import SpriteKit

enum rotationDirection{
    case clockwise
    case counterClockwise
    case none
}

class GameScene: SKScene {
    
    //gamescene.sks elements
    var wheelie:SKSpriteNode!
    var playerOneLabel:SKLabelNode!
    var playerTwoLabel:SKLabelNode!
    var playerThreeLabel:SKLabelNode!
    var playerFourLabel:SKLabelNode!
    var thePointer:SKSpriteNode!
    var theMark1:SKSpriteNode!
    var theMark2:SKSpriteNode!
    var theMark3:SKSpriteNode!
    var theMark4:SKSpriteNode!
    var theDot:SKSpriteNode!
    
    var viewController : WheelPageVC!
    
    var currentRotationDirection = rotationDirection.none
    //var sprite = SKSpriteNode(imageNamed: "wheel")
    var selectedPlayer: String = "First Player"
    var players:[String] = []
    var playerLabels:[SKLabelNode] = []
    
    var theDistance:CGFloat!
    
    //ngitung jarak antara dua node
    func distanceFrom(posA: CGPoint, posB: CGPoint) -> CGFloat {
        let aSquared = (posA.x - posB.x) * (posA.x - posB.x)
        let bSquared = (posA.y - posB.y) * (posA.y - posB.y)
        return sqrt(aSquared + bSquared)
    }
        
    override func didMove(to view: SKView) {
//        sprite.setScale(0.75)
//        sprite.physicsBody = SKPhysicsBody(rectangleOf: sprite.size)
//        sprite.physicsBody?.affectedByGravity = false
//        sprite.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
//        self.addChild(sprite)
//
        
        //give data to (or from) storyboard
        players = self.userData!["gameInfo"] as! [String]
        
        //assign element from gamescene.sks
        wheelie = (childNode(withName: "wheelie") as! SKSpriteNode)
        playerLabels.append(wheelie.childNode(withName: "playerOneLabel") as! SKLabelNode)
        playerLabels.append(wheelie.childNode(withName: "playerTwoLabel") as! SKLabelNode)
        playerLabels.append(wheelie.childNode(withName: "playerThreeLabel") as! SKLabelNode)
        playerLabels.append(wheelie.childNode(withName: "playerFourLabel") as! SKLabelNode)
        thePointer = (childNode(withName: "thePointer") as! SKSpriteNode)
        
        theMark1 = wheelie.childNode(withName: "player1sensor") as! SKSpriteNode
        theMark2 = wheelie.childNode(withName: "player2sensor") as! SKSpriteNode
        theMark3 = wheelie.childNode(withName: "player3sensor") as! SKSpriteNode
        theMark4 = wheelie.childNode(withName: "player4sensor") as! SKSpriteNode
        theDot = childNode(withName: "theDot") as! SKSpriteNode
        
        
        //assign labels on wheel
        for i in 0...3 {
            playerLabels[i].text=players[i]
        }
        
        
        print(players)
        selectedPlayer = players[0]
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if let vc = appDelegate.window?.rootViewController {
            self.viewController = vc as? WheelPageVC
            //self.viewController.pemain = "haha"
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch : UITouch = touches.first else {return}
        let touchPosition = touch.location(in: self)
        let newRotationDirection : rotationDirection = touchPosition.x < self.frame.midX ? .clockwise : .counterClockwise
        
        if currentRotationDirection != newRotationDirection && currentRotationDirection != .none{
            reverseRotation()
            currentRotationDirection = newRotationDirection
        } else if currentRotationDirection == newRotationDirection{
            print("STOP!")
            stopRotation()
            currentRotationDirection = .none
        } else if (currentRotationDirection == .none){
            setupRotationWith(direction: newRotationDirection)
            currentRotationDirection = newRotationDirection
        }
    }
    
    func reverseRotation(){
        let oldRotateAction = wheelie.action(forKey: "rotate")
        let newRotateAction = SKAction.reversed(oldRotateAction!)
        wheelie.run(newRotateAction(), withKey: "rotate")
    }
    
    func stopRotation(){
        wheelie.removeAction(forKey: "rotate")
        
        //var x = CGPoint(x: 75.40951538085938, y: 170.07186889648438)
        //print(theDot.position)
        if theMark1.intersects(theDot){
            print("ada 1")
            print(players[0])
            GameData.selectedPlayer = players[0]
        } else if theMark2.intersects(theDot) {
            print("ada 2")
            print(players[1])
            GameData.selectedPlayer = players[1]
        } else if theMark3.intersects(theDot) {
            print("ada 3")
            print(players[2])
            GameData.selectedPlayer = players[2]
        } else if theMark4.intersects(theDot) {
            print("ada 4")
            print(players[3])
            GameData.selectedPlayer = players[3]
        }
        
        //it's unused
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        if let vc = appDelegate.window?.rootViewController {
//            self.viewController = vc as? WheelPageVC
//            //self.viewController.pemain = selectedPlayer
//        }
        
       // let challangeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChallengePageVC" as! ChallengePageVC)
        
    }
    
    //setup rotation
    func setupRotationWith(direction: rotationDirection){
        let angle : Float = (direction == .clockwise) ? Float(Double.pi/2) : Float(Double.pi/2)
        let rotate = SKAction.rotate(byAngle: CGFloat(angle), duration: 0.1)
        let repeatAction = SKAction.repeatForever(rotate)
        wheelie.run(repeatAction, withKey: "rotate")
    }
}
