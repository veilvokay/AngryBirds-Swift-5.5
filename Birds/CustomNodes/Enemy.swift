//
//  Enemy.swift
//  Birds
//
//  Created by Roman Yakovliev on 22.10.2021.
//

import SpriteKit

enum EnemyType: String {
    case orange
}

class Enemy: SKSpriteNode {

    let type: EnemyType
    let animationFrames: [SKTexture]
    var health: Int
    let damageThreshold: Int
    
    init(type: EnemyType) {
        self.type = type
        animationFrames = AnimationHelper.loadTextures(from: SKTextureAtlas(named: "orange"), withName: type.rawValue)
        
        switch type {
        case .orange:
            health = 100
        }
        
        damageThreshold = health/2
        
        let texture = SKTexture(imageNamed: type.rawValue + "1")
        super.init(texture: texture, color: .clear, size: CGSize.zero)
        animateEnemy()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animateEnemy() {
        run(SKAction.repeatForever(SKAction.animate(with: animationFrames, timePerFrame: 0.3, resize: false, restore: true)))
    }
    
    func createPhysicsBody() {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.isDynamic = true // can be impacted
        physicsBody?.categoryBitMask = PhysicsCategory.enemy
        physicsBody?.contactTestBitMask = PhysicsCategory.all // Can contact with:
        physicsBody?.collisionBitMask = PhysicsCategory.all // Can collide with:
    }
    
    func impact(with force: Int) -> Bool {
        health -= force
        if health < 1 {
            removeFromParent()
            return true
        }
        return false
    }
    
}
