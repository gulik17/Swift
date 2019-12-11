//
//  GameScene.swift
//  gameSnake8
//
//  Created by Shakhvorostov on 10.12.2019.
//  Copyright © 2019 Shakhvorostov. All rights reserved.
//

import SpriteKit
import GameplayKit

struct CollisionCategory {
    static let Snake: UInt32 = 0x1 << 0
    static let SnakeHead: UInt32 = 0x1 << 1
    static let Apple: UInt32 = 0x1 << 2
    static let EdgeBody: UInt32 = 0x1 << 3
}

class GameScene: SKScene {
    var snake: Snake?
    let gameOverLabel = SKLabelNode(fontNamed: "Chalkduster")
    let restartBtn = SKShapeNode()
    let restartLabel = SKLabelNode(fontNamed: "Chalkduster")
   
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black

        self.physicsWorld.gravity = CGVector.zero
        self.physicsWorld.contactDelegate = self

        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.categoryBitMask = CollisionCategory.EdgeBody
        self.physicsBody?.collisionBitMask = CollisionCategory.Snake | CollisionCategory.SnakeHead

        view.showsPhysics = true

        let counterClockwiseButton = SKShapeNode()
        counterClockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        counterClockwiseButton.position = CGPoint(x: view.scene!.frame.minX+30, y: view.scene!.frame.minY+30)
        counterClockwiseButton.fillColor = UIColor.gray
        counterClockwiseButton.strokeColor = UIColor.gray
        counterClockwiseButton.lineWidth = 10
        counterClockwiseButton.name = "counterClockwiseButton"
        self.addChild(counterClockwiseButton)
        
        let clockWiseButton = SKShapeNode()
        clockWiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        clockWiseButton.position = CGPoint(x: view.scene!.frame.maxX-80, y: view
            .scene!.frame.minY+30)
        clockWiseButton.fillColor = UIColor.gray
        clockWiseButton.strokeColor = UIColor.gray
        clockWiseButton.lineWidth = 10
        clockWiseButton.name = "clockWiseButton"
        self.addChild(clockWiseButton)
        
        createApple()
        snake = Snake(atPoint: CGPoint(x: view.scene!.frame.midX, y: view.scene!.frame.midY))
        self.addChild(snake!)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches  {
            let touchLocation = touch.location(in: self)
            guard let touchesNode = self.atPoint(touchLocation) as? SKShapeNode, touchesNode.name == "counterClockwiseButton" || touchesNode.name == "clockWiseButton" || touchesNode.name == "restartBtn" else {
                return
            }
            if snake == nil {
                if touchesNode.name == "restartBtn" {
                    restartBtn.removeFromParent()
                    restartLabel.removeFromParent()
                    gameOverLabel.removeFromParent()
                    snake = Snake(atPoint: CGPoint(x: self.view!.scene!.frame.midX, y: self.view!.scene!.frame.midY))
                    self.addChild(snake!)
                }
                return
            }
            touchesNode.fillColor = UIColor.green
            if touchesNode.name == "counterClockwiseButton" {
                snake!.moveCounterClockwise()
            } else if touchesNode.name == "clockWiseButton" {
                snake!.moveClockwise()
            }
        }
    }

    private func createApple() {
        let randX = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxX - 10)))
        let randY = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxY - 200)))
        let apple = Apple(position: CGPoint(x: randX, y: randY+190))
        self.addChild(apple)
    }
    
    private func createElement() {
        let centerX = view!.scene!.frame.midX
        let centerY = view!.scene!.frame.midY
        gameOverLabel.position = CGPoint(x: centerX, y: centerY)
        gameOverLabel.fontSize = 25;
        gameOverLabel.fontColor = SKColor.white
        gameOverLabel.color = SKColor.blue
        gameOverLabel.colorBlendFactor = 0.5
        gameOverLabel.text = "Game Over"
        gameOverLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        gameOverLabel.name = "gameOver"

        restartBtn.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 100, height: 45)).cgPath
        restartBtn.position = CGPoint(x: centerX-50, y: centerY-60)
        restartBtn.fillColor = UIColor.black
        restartBtn.strokeColor = UIColor.black
        restartBtn.lineWidth = 10
        restartBtn.name = "restartBtn"
        
        restartLabel.position = CGPoint(x: restartBtn.frame.midX, y: restartBtn.frame.midY)
        restartLabel.fontSize = restartBtn.frame.size.width / 6
        restartLabel.fontColor = SKColor.green
        restartLabel.text = "Restart"
        restartLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        restartLabel.name = "restartLabel"
    }
    
    private func gameOver() {
        if gameOverLabel.name == nil {
            createElement()
        }

        self.addChild(gameOverLabel)
        self.addChild(restartLabel)
        self.addChild(restartBtn)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            guard let touchesNode = self.atPoint(touchLocation) as? SKShapeNode, touchesNode.name == "counterClockwiseButton" || touchesNode.name == "clockWiseButton" else {
              return
            }
            touchesNode.fillColor = UIColor.gray
        }
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        if snake == nil {
            return
        }
        snake!.move()
    }
}

extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact){
        let bodyes = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        let collisionObject  = bodyes ^ CollisionCategory.SnakeHead
        switch collisionObject {
        case CollisionCategory.Apple:
            let apple = contact.bodyA.node is Apple ? contact.bodyA.node : contact.bodyB.node
            snake?.addBodyPart()
            apple?.removeFromParent()
            createApple()
        case CollisionCategory.EdgeBody:
            snake?.removeFromParent()
            snake = nil
            gameOver()
        default:
            break
        }
    }
}
