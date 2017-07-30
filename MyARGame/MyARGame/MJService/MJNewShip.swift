//
//  MJNewShip.swift
//  MyARGame
//
//  Created by Michael 柏 on 2017/7/30.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

import SceneKit
import ARKit

extension ARSCNView {
    
    func newShip() {
        
        let newShip = MJShipModel ()
        
        let x = -0.5[0.5]
        let y = -0.5[0.5]

        newShip.position = SCNVector3(x, y, -1)
        self.scene.rootNode.addChildNode(newShip)
    }
}

extension Double {
    
    subscript(_ end : Double) -> Float {
        
        // 随机0 - 1 之间的小数
        let factor =   Double(arc4random()) / Double(UInt32.max)
        
        // 1 - 100之间的随机数  算法: 用大数 减去区间内的一个数
        // 100 - (100 - 1) *factor
        
        return Float(end - factor * (end - self))
    }
}
