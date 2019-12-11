//
//  Apple.swift
//  gameSnake8
//
//  Created by Shakhvorostov on 10.12.2019.
//  Copyright © 2019 Shakhvorostov. All rights reserved.
//

import SpriteKit

class Apple: SKShapeNode {
    
    convenience init(position: CGPoint) {
        self.init()
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 10, height: 10)).cgPath
        fillColor = UIColor.red
        strokeColor = UIColor.red
        lineWidth = 5
        self.position = position
        self.physicsBody = SKPhysicsBody(circleOfRadius: 10.0, center: CGPoint(x:5, y:5))
        self.physicsBody?.categoryBitMask = CollisionCategory.Apple
    }
}
