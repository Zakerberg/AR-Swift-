//
//  MJShipModel.swift
//  MyARGame
//
//  Created by Michael 柏 on 2017/7/29.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

import UIKit
import SceneKit

class MJShipModel: SCNNode {
    override init() {
        super.init()
        
        //几何定义
        let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        self.geometry = box
        
        // 物理实体
        let shap = SCNPhysicsShape(geometry: box)
        self.physicsBody = SCNPhysicsBody(type: .dynamic, shape: shap)
        
        // 不受引力影响(悬浮)
        self.physicsBody?.isAffectedByGravity = false
        //识别掩码
        self.physicsBody?.categoryBitMask    = 1 << 0
        //接触时要通知的节点掩码
        self.physicsBody?.contactTestBitMask = 1 << 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
