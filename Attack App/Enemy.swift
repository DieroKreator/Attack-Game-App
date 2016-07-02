//
//  Enemy.swift
//  Attack App
//
//  Created by Diero Kreator on 2016-06-27.
//  Copyright © 2016 Diero Kreator. All rights reserved.
//

import Foundation

class Enemy: Character {
    
    private var _name = "Anthrax"
    
    var name: String {
        get {
            return _name
        }
    }
    
    convenience init (name: String, hp: Int, attackPwr: Int){
        
        self.init(startingHp: hp, attackPwr: attackPwr)
        
        _name = name
    }
    
}