//
//  ViewController.swift
//  TicTacToe
//
//  Created by Samir Ben Bouker on 11/01/2021.
//  Copyright © 2021 Samir Ben Bouker. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIAlertViewDelegate {
    
    //buttons
    @IBOutlet weak var button00: UIButton!
    
    @IBOutlet weak var button01: UIButton!
    
    @IBOutlet weak var button02: UIButton!
    
    @IBOutlet weak var button10: UIButton!
    
    @IBOutlet weak var button11: UIButton!
    
    @IBOutlet weak var button12: UIButton!
    
    @IBOutlet weak var button20: UIButton!
    
    @IBOutlet weak var button21: UIButton!
    
    @IBOutlet weak var button22: UIButton!
    
    //turn
    var activePlayer = 1
    
    //label points
    @IBOutlet weak var labelPointsP1: UILabel!
    
    @IBOutlet weak var labelPointsP2: UILabel!
    
    //label turn
    @IBOutlet weak var labelTurn: UILabel!
    
    //type tab
    let tabPlayer1:String = "o"
    let tabPlayer2:String = "x"
    let tabGame:String = "base"
    
    //win games players
    var winsPlayer1:Int = 0
    var winsPlayer2:Int = 0
    
    //reflects the state of the game
    var gameState = [0,0,0,
                     0,0,0,
                     0,0,0]
    
    @IBAction func action(_ sender: Any) {
        
        if(gameState[(sender as AnyObject).tag-1] == 0) {
            
            gameState[(sender as AnyObject).tag-1] = activePlayer
            
            if(activePlayer == 1) {
                
                (sender as AnyObject).setImage(UIImage(named: tabPlayer1), for: .normal)
                activePlayer = 2
                labelTurn.text = "Player 2"
                
                checkWin(player: activePlayer, gameState: gameState)
                
            }
            else{
                
                (sender as AnyObject).setImage(UIImage(named: tabPlayer2), for: .normal)
                activePlayer = 1
                labelTurn.text = "Player 1"
                
                checkWin(player: activePlayer, gameState: gameState)
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelPointsP1.text = "\(winsPlayer1)"
        labelPointsP2.text = "\(winsPlayer2)"

    }
    
    func checkWin(player:Int, gameState:[Int]) {
        
        var endGame:Bool = false
        
        while(!endGame) {
            
            //check diagonals
            if(checkDiagonal(player: player, gameState: [gameState[0], gameState[4], gameState[8]])) { // diagonal 0 4 9
                
                endGame = true
                break;
                
            }
            else if(checkDiagonal(player: player, gameState: [gameState[3], gameState[4], gameState[6]])) {  // diagonal 3 4 6
                
                endGame = true
                break;
                
            }
            //check horizontals
            else if(checkHorizontal(player: player, gameState: [gameState[0], gameState[1], gameState[2]] )) { // horizontal 0 1 2
                
                endGame = true
                break;
                
            }
            else if(checkHorizontal(player: player, gameState: [gameState[3], gameState[4], gameState[5]])) { // horizontal 3 4 5
                
                endGame = true
                break;
                
            }
            else if(checkHorizontal(player: player, gameState:  [gameState[6], gameState[7], gameState[8]])) { // horizontal 6 7 8
                
                endGame = true
                break;
                
            }
            else if(checkVertical(player: player, gameState: [gameState[0], gameState[3], gameState[6]] )) { // vertical 0 3 6
                
                endGame = true
                break;
                
            }
            else if(checkVertical(player: player, gameState: [gameState[1], gameState[4], gameState[7]] )) { // vertical 1 4 7
                
                endGame = true
                break;
                
            }
            else if(checkVertical(player: player, gameState: [gameState[2], gameState[5], gameState[8]])) { // vertical 2 5 8
                
                endGame = true
                break;
                
            }
            
            if(endGame == false) {
                var count:Int = 0
                for x in 0...gameState.count-1 {
                    if(gameState[x] != 0) {
                        
                        count += 1
                        print("count = \(count)")
                        
                    }
                }
                
                if(count == 9) {
                    
                    tie()
                    endGame = true
                    
                }
                else {

                    endGame = true
                    count = 0
                    
                }
            }
            
        }
        
    }
    
    func checkDiagonal(player:Int, gameState:[Int]) -> Bool {
        
        let first:Int = gameState[0]
        let second:Int = gameState[1]
        let third:Int = gameState[2]
        
        if((first == second && first == third) && (first == player && second == player && third == player)) {
            
            showDialog(player: player)

            return true
        }
        else {
            
            return false
            
        }
    }
    
    func checkHorizontal(player:Int, gameState:[Int]) -> Bool {
        
        let first:Int = gameState[0]
        let second:Int = gameState[1]
        let third:Int = gameState[2]
        
        if((first == second && first == third) && (first == player && second == player && third == player)) {
            
            showDialog(player: player)

            return true
        }
        else {
            
            return false
            
        }
    }
    
    func checkVertical(player:Int, gameState:[Int]) -> Bool {
        
        let first:Int = gameState[0]
        let second:Int = gameState[1]
        let third:Int = gameState[2]
        
        if((first == second && first == third) && (first == player && second == player && third == player)) {
            
            showDialog(player: player)

            return true
            
        }
        else {
            
            return false
            
        }
    }
    
    func showDialog(player:Int) {
        
        if(player == 1) {
            
            let alert = UIAlertController(title: "WIN", message: "WINNER IS PLAYER 1", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "PLAY AGAIN", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            winsPlayer1 += 1
            labelPointsP1.text = "\(winsPlayer1)"
            resetGame()
            
        }
        else {
            
            let alert = UIAlertController(title: "WIN", message: "WINNER IS PLAYER 2", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "PLAY AGAIN", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            winsPlayer2 += 1
            labelPointsP2.text = "\(winsPlayer2)"
            resetGame()
            
        }
    }
    
    func resetGame() {
        
        self.gameState = [0,0,0,0,0,0,0,0,0]
        
        button00.setImage(UIImage(named:tabGame), for: .normal)
        button01.setImage(UIImage(named:tabGame), for: .normal)
        button02.setImage(UIImage(named:tabGame), for: .normal)
        
        button10.setImage(UIImage(named:tabGame), for: .normal)
        button11.setImage(UIImage(named:tabGame), for: .normal)
        button12.setImage(UIImage(named:tabGame), for: .normal)
        
        button20.setImage(UIImage(named:tabGame), for: .normal)
        button21.setImage(UIImage(named:tabGame), for: .normal)
        button22.setImage(UIImage(named:tabGame), for: .normal)
        
    }
    
    func tie() {
        
        let alert = UIAlertController(title: "TIE", message: "ANY PLAYER WIN", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "PLAY AGAIN", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        resetGame()
        
    }

    @IBAction func resetGameButton(_ sender: Any) {
        
        self.gameState = [0,0,0,0,0,0,0,0,0]
        
        button00.setImage(UIImage(named:tabGame), for: .normal)
        button01.setImage(UIImage(named:tabGame), for: .normal)
        button02.setImage(UIImage(named:tabGame), for: .normal)
        
        button10.setImage(UIImage(named:tabGame), for: .normal)
        button11.setImage(UIImage(named:tabGame), for: .normal)
        button12.setImage(UIImage(named:tabGame), for: .normal)
        
        button20.setImage(UIImage(named:tabGame), for: .normal)
        button21.setImage(UIImage(named:tabGame), for: .normal)
        button22.setImage(UIImage(named:tabGame), for: .normal)
        
        labelPointsP1.text = "0"
        labelPointsP2.text = "0"
        
    }
}



