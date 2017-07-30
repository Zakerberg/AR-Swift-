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
        
        let x = 0.5
        let y = 0.5
        let z = -1.0
        
        newShip.position = SCNVector3(x, y, z)
        self.scene.rootNode.addChildNode(newShip)

    }
}
