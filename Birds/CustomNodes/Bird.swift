//
//  Bird.swift
//  Birds
//
//  Created by Roman Yakovliev on 17.10.2021.
//

import SpriteKit

enum BirdType: String {
    case red, blue, yellow, gray
}

class Bird: SKSpriteNode {
    
    let birdType: BirdType
    
    var grabbed = false
    var flying = false {
        didSet {
            if flying {
                physicsBody?.isDynamic = true
            }
        }
    }
    
    init(type: BirdType) {
        birdType = type
        
        let color: UIColor!
        let texture: SKTexture!
        
        switch type {
        case .red, .blue, .yellow, .gray:
            texture = SKTexture(imageNamed: birdType.rawValue + "1")
        }
        
        super.init(texture: texture, color: UIColor.clear, size: CGSize(width: 40.0, height: 40.0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
