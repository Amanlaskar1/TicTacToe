//
//  ViewController.swift
//  TicTacToeGame
//
//  Created by STI MAC 10 on 2023-09-18.
//


import UIKit

class ViewController: UIViewController {
    
    
    // Player turn
    enum Turn {
        case playerX
        case playerO
    }
    
  

    // Outlet for elements
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
   
    // game state
    var firstTurn = Turn.playerX
    var currentTurn = Turn.playerX
    
    var playerO = "O"
    var playerX = "X"
    var board = [UIButton]()
    
    var oScore = 0
    var xScore = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
        }
    // Game Board
    func initBoard()
        {
            board.append(a1)
            board.append(a2)
            board.append(a3)
            board.append(b1)
            board.append(b2)
            board.append(b3)
            board.append(c1)
            board.append(c2)
            board.append(c3)
        }

// Action when a game board button is tapped
    @IBAction func boardTapAction(_ sender: UIButton) {
    
            addToBoard(sender)
            // Victory
            if checkForVictory(playerX)
            {
                xScore += 1
                resultAlert(title: "X Win!")
            }
            
            if checkForVictory(playerO)
            {
                oScore += 1
                resultAlert(title: "O Win!")
            }
            
            if(fullBoard())
            {
                resultAlert(title: "Draw")
            }
        }
        
        // Check if a player has won with the given symbol
        func checkForVictory(_ s :String) -> Bool
        {
            // Horizontal Victory
            if thisSymbol(a1, s) && thisSymbol(a2, s) && thisSymbol(a3, s)
            {
                return true
            }
            if thisSymbol(b1, s) && thisSymbol(b2, s) && thisSymbol(b3, s)
            {
                return true
            }
            if thisSymbol(c1, s) && thisSymbol(c2, s) && thisSymbol(c3, s)
            {
                return true
            }
            
            // Vertical Victory
            if thisSymbol(a1, s) && thisSymbol(b1, s) && thisSymbol(c1, s)
            {
                return true
            }
            if thisSymbol(a2, s) && thisSymbol(b2, s) && thisSymbol(c2, s)
            {
                return true
            }
            if thisSymbol(a3, s) && thisSymbol(b3, s) && thisSymbol(c3, s)
            {
                return true
            }
            
            // Diagonal Victory
            if thisSymbol(a1, s) && thisSymbol(b2, s) && thisSymbol(c3, s)
            {
                return true
            }
            if thisSymbol(a3, s) && thisSymbol(b2, s) && thisSymbol(c1, s)
            {
                return true
            }
            
            return false
        }
        // Check if the given button has the specified symbol

        func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool
        {
            return button.title(for: .normal) == symbol
        }
        // Display a result alert with the game outcome
        func resultAlert(title: String)
        {
            let message = "\nplayerO " + String(oScore) + "\n\nplayerX " + String(xScore)
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
                self.resetBoard()
            }))
            self.present(ac, animated: true)
        }
    
    
   
        // Reset the Game Board
        func resetBoard()
        {
            for button in board
            {
                button.setTitle(nil, for: .normal)
                button.isEnabled = true
            }
            if firstTurn == Turn.playerO
            {
                firstTurn = Turn.playerX
                turnLabel.text = playerX
            }
            else if firstTurn == Turn.playerX
            {
                firstTurn = Turn.playerX
                turnLabel.text = playerO
            }
            currentTurn = firstTurn
        }
    

        // Check if the board is full
        func fullBoard() -> Bool
        {
            for button in board
            {
                if button.title(for: .normal) == nil
                {
                    return false
                }
            }
            return true
        }
        // Add a player's symbol to the game board
        func addToBoard(_ sender: UIButton)
        {
            if(sender.title(for: .normal) == nil)
            {
                if(currentTurn == Turn.playerO)
                {
                    sender.setTitle(playerO, for: .normal)
                    currentTurn = Turn.playerX
                    turnLabel.text = playerX
                }
                else if(currentTurn == Turn.playerX)
                {
                    sender.setTitle(playerX, for: .normal)
                    currentTurn = Turn.playerO
                    turnLabel.text = playerO
                }
                sender.isEnabled = false
            }
        }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
