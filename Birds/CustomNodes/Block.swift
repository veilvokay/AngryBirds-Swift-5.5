//
//  Block.swift
//  Birds
//
//  Created by Roman Yakovliev on 17.10.2021.
//

import SpriteKit

enum BlockType: String {
    case wood, stone, glass
}

class Block: SKSpriteNode {

    let type: BlockType
    var health: Int
    let damageThreshold: Int
    
    init(type: BlockType) {
        self.type = type
        switch type {
        case .wood:
            health = 100
        case .stone:
            health = 500
        case .glass:
            health = 50
        }
        damageThreshold = health/2
        super.init(texture: nil, color: .clear, size: CGSize.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func physicsBody() {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.isDynamic = true
        physicsBody?.categoryBitMask = PhysicsCategory.block
        physicsBody?.contactTestBitMask = PhysicsCategory.all
        physicsBody?.collisionBitMask = PhysicsCategory.all
    }
    
    func impact(with force: Int) {
        health -= force
        print("Current health: \(health)")
        if health < 1 {
            removeFromParent()
        } else if health < damageThreshold {
            color = UIColor.red
        }
    }
    
    
}