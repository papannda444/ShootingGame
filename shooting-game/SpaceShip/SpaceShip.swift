//
//  SpaceShip.swift
//  shooting-game
//
//  Created by papannda444 on 2019/03/03.
//  Copyright © 2019 三野田脩. All rights reserved.
//

import Foundation
import SpriteKit

protocol SpaceShipDelegate: AnyObject {
    func displayHeart(hearts: [SKSpriteNode])
    func addBullet(bulletType: Bullet.BulletType, position: CGPoint, _ positions: CGPoint..., action: SKAction)
}

protocol SpaceShip {
    var delegate: SpaceShipDelegate? { get set }
    var state: SpaceShipState { get set }
    var moveSpeed: CGFloat { get set }
    var hearts: [SKSpriteNode] { get set }
    var bulletTimer: Timer? { get set }
    var timerForPowerItem: Timer? { get set }
    var powerUpTime: Float { get set }

    func setPhysicsBody(categoryBitMask: UInt32, contactTestBitMask: UInt32)
    func moveToPosition(touchPosition position: CGPoint)
    func powerUp(itemType: PowerItem.ItemType)
    func touchViewBegin(touchedViewFrame frame: CGRect)
    func touchViewEnd()
}

extension SpaceShip {
    mutating func setHitPoint(hitPoint: Int) {
        for _ in 1...hitPoint {
            let heart = SKSpriteNode(imageNamed: "heart")
            heart.scale(to: CGSize(width: 50, height: 50))
            hearts.append(heart)
        }
        guard let delegate = delegate else {
            return
        }
        delegate.displayHeart(hearts: hearts)
    }

    func isShipState(equal state: SpaceShipState) -> Bool {
        return self.state == state
    }
}
