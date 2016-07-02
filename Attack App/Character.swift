//
//  Character.swift
//  Attack App
//
//  Created by Diero Kreator on 2016-06-27.
//  Copyright © 2016 Diero Kreator. All rights reserved.
//

import Foundation

class Character {
    
    private var _hp: Int = 90
    private var _attackPwr = 30
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
    var isAlive: Bool {
        get {
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    init (startingHp: Int, attackPwr: Int) {
        self._hp = startingHp
        self._attackPwr = attackPwr
    }
    
    func attemptToAttack (attackPwr: Int) -> Bool {
        self._hp -= attackPwr
        return true
    }
    
}