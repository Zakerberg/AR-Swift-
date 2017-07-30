//
//  MJSound.swift
//  MyARGame
//
//  Created by Michael 柏 on 2017/7/30.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

import AVFoundation

func playSound(of effect : soundEffect) {
    
    OperationQueue.main.addOperation {
        
        let player : AVAudioPlayer!
        
        if let url = Bundle.main.url(forResource: effect.rawValue, withExtension: "mp3", subdirectory: "resource"){
            
            player = try? AVAudioPlayer(contentsOf: url)
            player.play()
            
        }
    }
}

enum soundEffect : String {
    
    case collision = "collision"
    case explosion = "explosion"
    case torpedo = "torpedo"
    
}


