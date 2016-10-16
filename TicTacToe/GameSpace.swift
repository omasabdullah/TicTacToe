import Foundation

class GameBlock {
    var occupant: OccupantType = .None
    
    init(occupant: OccupantType) {
        self.occupant = occupant
    }
}
