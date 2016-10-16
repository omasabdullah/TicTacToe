import UIKit

class GameCell : UICollectionViewCell {
    
    @IBOutlet weak var imageViewIcon: UIImageView!
    
    func setCell(gameSpace: GameSpace) {
        imageViewIcon.image = nil
        switch (gameSpace.occupant) {
        case .playerOne:
            imageViewIcon.image = UIImage(named: "ic_o")
            break
        case .playerTwo:
            imageViewIcon.image = UIImage(named: "ic_x")
            break
        case .none:
            break
        }
    }
}
