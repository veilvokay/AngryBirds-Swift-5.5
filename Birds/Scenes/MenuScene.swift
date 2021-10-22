//
//  MenuScene.swift
//  Birds
//
//  Created by Roman Yakovliev on 18.10.2021.
//

import SpriteKit

class MenuScene: SKScene {
    
    var SceneManagerDelegate: SceneManagerDelegate?
    
    override func didMove(to view: SKView) {
        setupMenu()
    }
    
    func setupMenu() {
        let background = SKSpriteNode(imageNamed: "menuBackground")
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.zPosition = ZPositions.background
        background.aspectScale(to: frame.size, width: true, multiplier: 1.0)
        addChild(background)
        
        let button = SpriteKitButton(defaultButtonImage: "playButton", action: goToLevelScene, index: 0)
        button.position = CGPoint(x: frame.midX, y: frame.midY*0.8)
        button.aspectScale(to: frame.size, width: false, multiplier: 0.2)
        button.zPosition = ZPositions.hudLabel
        addChild(button)
    }
    
    func goToLevelScene(_: Int) {
        SceneManagerDelegate?.presentLevelScene()
    }

}
