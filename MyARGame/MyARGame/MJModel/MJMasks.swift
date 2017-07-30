//
//  MJMasks.swift
//  MyARGame
//
//  Created by Michael 柏 on 2017/7/30.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

struct Masks : OptionSet {
    
    let rawValue : Int
    
    static let ship     = Masks(rawValue : 1 << 0)
    static let bullet   = Masks(rawValue : 1 << 1)
}
