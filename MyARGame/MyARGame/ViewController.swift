//
//  ViewController.swift
//  MyARGame
//
//  Created by Michael 柏 on 2017/7/29.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate,SCNPhysicsContactDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        sceneView.showsStatistics = true
        let scene = SCNScene()
        sceneView.scene = scene
        
        // 添加新飞船
        sceneView.newShip()
        
    }
    
    /// shoot 发射子弹
    @IBAction func shoot(_ sender: UITapGestureRecognizer) {
        
        sceneView.shootBullet()
        playSound(of: .torpedo)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingSessionConfiguration()
        configuration.planeDetection = .horizontal
        configuration.isLightEstimationEnabled  = true
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    func removeNodeDynamic(node: SCNNode, isExplode: Bool) {
        playSound(of: .collision)
        
        if isExplode {
            playSound(of: .explosion)
            
            let ps = SCNParticleSystem(named: "explosion", inDirectory: nil)
            let psNode = SCNNode()
            psNode.addParticleSystem(ps!)
            
            psNode.position = node.position
            sceneView.scene.rootNode.addChildNode(psNode)
        }
        node.removeFromParentNode()
    }
    
    //MARK: - SCNPhysicsContactDelegate
    
    func physicsWorld(_ world: SCNPhysicsWorld, didBegin contact: SCNPhysicsContact) {
        
        print("击中")
        // 子弹是NodeB
        removeNodeDynamic(node: contact.nodeB, isExplode: false)
        
        // 延迟0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.removeNodeDynamic(node: contact.nodeA, isExplode: true)
            self.sceneView.newShip()
        }
    }
    
    //MARK: - ARSCNViewDelegate
    
    /*
     // Override to create and configure nodes for anchors added to the view's session.
     func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
     let node = SCNNode()
     
     return node
     }
     */
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
