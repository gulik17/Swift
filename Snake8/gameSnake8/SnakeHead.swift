//
//  SnakeHead.swift
//  gameSnake8
//
//  Created by Shakhvorostov on 10.12.2019.
//  Copyright © 2019 Shakhvorostov. All rights reserved.
//

import SpriteKit

class SnakeHead: SnakeBodyPart {
    
    override init(atPoint point: CGPoint) {
        super.init(atPoint: point)
        self.physicsBody?.categoryBitMask = CollisionCategory.SnakeHead
        self.physicsBody?.contactTestBitMask = CollisionCategory.EdgeBody | CollisionCategory.Apple | CollisionCategory.Snake
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
