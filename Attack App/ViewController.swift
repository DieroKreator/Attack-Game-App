//
//  ViewController.swift
//  Attack App
//
//  Created by Diero Kreator on 2016-06-26.
//  Copyright © 2016 Diero Kreator. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printLbl: UILabel!
    @IBOutlet weak var enemyHPLbl: UILabel!
    @IBOutlet weak var playerHPLbl: UILabel!
    @IBOutlet weak var enemyImg: UIImageView!
    @IBOutlet weak var playerImg: UIImageView!
    @IBOutlet weak var enemyBtn: UIButton!
    @IBOutlet weak var playerBtn: UIButton!
    @IBOutlet weak var enemyBtnLbl: UILabel!
    @IBOutlet weak var playerBtnLbl: UILabel!
    @IBOutlet weak var restartBtn: UIButton!

    
    var player: Player!
    var enemy: Enemy!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player (name: "Gladiator", hp: 100, attackPwr: 25)
        enemy = Enemy (name: "Koopa", hp: 125, attackPwr: 25)
    }
    
    func enableBtn() {
        self.enemyBtn.enabled = true
        self.playerBtn.enabled = true
    }
    
    func disableTimer() {
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.enableBtn), userInfo: nil, repeats: false)
    }
    
    func showWinner() {
        if !player.isAlive {
            playerHPLbl.text = ""
            printLbl.text = "\(enemy.name) Won"
            playerImg.hidden = true
            enemyBtn.hidden = true
            playerBtn.hidden = true
            enemyBtnLbl.hidden = true
            playerBtnLbl.hidden = true
            prepareForReset()
        } else if !enemy.isAlive {
            enemyHPLbl.text = ""
            printLbl.text = "\(player.name) Won"
            enemyImg.hidden = true
            enemyBtn.hidden = true
            playerBtn.hidden = true
            enemyBtnLbl.hidden = true
            playerBtnLbl.hidden = true
            prepareForReset()
        }
    }
    
    func clearScreen() {
        printLbl.text = ""
        enemyHPLbl.text = ""
        enemyImg.hidden = true
        playerHPLbl.text = ""
        playerImg.hidden = true
    }
    
    func prepareForReset() {
        NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: #selector(ViewController.clearScreen), userInfo: nil, repeats: false)
        NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: #selector(ViewController.restartGame), userInfo: nil, repeats: false)
    }
    
    func restartGame() {
        restartBtn.hidden = false
    }
    
    @IBAction func onAttackEnemyBtnPressed (sender: AnyObject){
        
        if player.attemptToAttack(enemy.attackPwr){
            printLbl.text = "Attacked \(player.name) for \(enemy.attackPwr) HP"
            playerHPLbl.text = "\(player.hp) HP"
            playerBtn.enabled = false
            disableTimer()
        } else {
            printLbl.text = "Attack was unsuccessful!"
        }
        
        showWinner()
    }
    
    @IBAction func onAttackPlayerBtnPressed (sender: AnyObject){
        
        if enemy.attemptToAttack(player.attackPwr){
            printLbl.text = "Attacked \(enemy.name) for \(player.attackPwr) HP"
            enemyHPLbl.text = "\(enemy.hp) HP"
            enemyBtn.enabled = false
            disableTimer()
        } else {
            printLbl.text = "Attack was unsuccessful!"
        }
        
        showWinner()
    }
    
    @IBAction func onTapRestartBtn(sender: AnyObject) {
        enemyHPLbl.text = "125 Hp"
        playerHPLbl.text = "100 HP"
        printLbl.text = "Press button to attack"
        playerImg.hidden = false
        enemyImg.hidden = false
        enemyBtn.hidden = false
        playerBtn.hidden = false
        enemyBtnLbl.hidden = false
        playerBtnLbl.hidden = false
        restartBtn.hidden = true
    }
}

