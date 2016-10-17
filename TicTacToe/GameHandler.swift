import Foundation

class GameHandler {
    var playerOneWins = 0
    var playerTwoWins = 0
    var currentTurn = PlayerType.playerOne
    var gameSpace = [GameSpace]()
    
    var delegate: GameHandlerDelegate?
    
    func nextTurn() {
        // Check if winner
        winCheck(a: 0, b: 1, c: 2)
        winCheck(a: 3, b: 4, c: 5)
        winCheck(a: 6, b: 7, c: 8)
        winCheck(a: 0, b: 3, c: 6)
        winCheck(a: 1, b: 4, c: 7)
        winCheck(a: 2, b: 5, c: 8)
        winCheck(a: 0, b: 4, c: 8)
        winCheck(a: 2, b: 4, c: 6)
        
        // Check end tie
        let p = gameSpace.filter { $0.occupant != .none }
        if p.count == 9 {
            if let delegate = delegate {
                delegate.gameEnd(finishString: "Tie Game!")
            }
        }
        
        currentTurn = currentTurn == .playerOne ? .playerTwo : .playerOne
    }
    
    func currentPlayerTurn() -> PlayerType {
        return currentTurn
    }
    
    func resetGame() {
        currentTurn = .playerOne
        
        gameSpace.removeAll()
        for _ in 0 ..< 9 {
            gameSpace.append(GameSpace())
        }
    }
    
    func winCheck(a: Int, b: Int, c: Int) {
        if (gameSpace[a].occupant, gameSpace[b].occupant) == (gameSpace[b].occupant, gameSpace[c].occupant) {
            
            var returnString = ""
            
            switch (gameSpace[a].occupant) {
            case .playerOne:
                playerOneWins += 1
                returnString = "Player one wins!"
                break
            case .playerTwo:
                playerTwoWins += 1
                returnString = "Player two wins!"
                break
            case .none:
                return
            }
            
            if let delegate = delegate {
                delegate.gameEnd(finishString: returnString)
            }
        }
    }
}

protocol GameHandlerDelegate {
    func gameEnd(finishString: String)
}
