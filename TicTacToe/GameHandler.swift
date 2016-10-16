import Foundation

class GameHandler {
    var playerOneWins = 0
    var playerTwoWins = 0
    var currentTurn = OccupantType.playerOne
    
    func nextTurn() {
        currentTurn = currentTurn == .playerOne ? .playerTwo : .playerOne
    }
    
    func currentPlayerTurn() -> OccupantType {
        return currentTurn
    }
}
