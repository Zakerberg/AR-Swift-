//
//  MJBulletModel.swift
//  MyARGame
//
//  Created by Michael 柏 on 2017/7/29.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

import UIKit
import SceneKit

class MJBulletModel: SCNNode {
    override init() {
        super.init()
        
        let sphere = SCNSphere(radius: 0.025)
        self.geometry = sphere
        
        let shape = SCNPhysicsShape(geometry: sphere)
        self.physicsBody = SCNPhysicsBody(type: .dynamic, shape: shape)
        
        self.physicsBody?.isAffectedByGravity = false
        self.physicsBody?.categoryBitMask    = 1 << 1
        self.physicsBody?.contactTestBitMask = 1 << 0

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
