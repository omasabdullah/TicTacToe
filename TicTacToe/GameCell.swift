import UIKit

class GameCell : UICollectionViewCell {
    
    @IBOutlet weak var imageViewIcon: UIImageView! {
        didSet {
            imageViewIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(trigger)))
        }
    }
    
    func setCell() {
        imageViewIcon.image = UIImage(named: "ic_x")
    }
    
    func trigger() {
        imageViewIcon.tintColor = UIColor.green
    }
}
