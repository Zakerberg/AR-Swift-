//
//  MJNewBullet.swift
//  MyARGame
//
//  Created by Michael 柏 on 2017/7/30.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//
import SceneKit
import ARKit

extension ARSCNView {
    
    func shootBullet() {
        
        let bullet = MJBulletModel()
        let (dir, pos) = getUserVector()
        
        bullet.position = pos
        // 子弹施加压力的方向
        bullet.physicsBody?.applyForce(dir, asImpulse: true)
        
        self.scene.rootNode.addChildNode(bullet)
    }
    
    func getUserVector() -> (SCNVector3, SCNVector3) {
        
        if let currentFrame = self.session.currentFrame {
            
            let matrix = SCNMatrix4(currentFrame.camera.transform)
            
            // 摄像头的方向
            let direction = SCNVector3(-matrix.m31, -matrix.m32, -matrix.m33)
            
            //  摄像头的位置
            let position = SCNVector3(matrix.m41, matrix.m42, matrix.m43)
            return (direction, position)
        }
        return (SCNVector3(0 , 0 ,-1) ,SCNVector3(0 , 0 , -0.2))
    }
}
