//
//  SnakeBodyPart.swift
//  gameSnake8
//
//  Created by Shakhvorostov on 10.12.2019.
//  Copyright © 2019 Shakhvorostov. All rights reserved.
//

import SpriteKit

class SnakeBodyPart: SKShapeNode {
    let diametr = 10
    
    init(atPoint point: CGPoint){
        super.init()
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: diametr, height: diametr)).cgPath
        fillColor = UIColor.green
        strokeColor = UIColor.green
        lineWidth = 5
        self.position = point
        self.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(diametr-4), center: CGPoint(x:5, y:5))
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = CollisionCategory.Snake
        self.physicsBody?.contactTestBitMask = CollisionCategory.EdgeBody | CollisionCategory.Apple
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
