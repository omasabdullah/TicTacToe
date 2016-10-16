import Foundation

class GameHandler {
    var playerOneWins = 0
    var playerTwoWins = 0
    var currentTurn = PlayerType.playerOne
    var gameSpace = [GameSpace]()
    
    func nextTurn() {
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
}

protocol GameHandlerDelegate {
    func gameWin(player: PlayerType)
}
