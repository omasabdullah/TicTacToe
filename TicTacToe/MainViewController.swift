import UIKit

class MainViewController : UIViewController {
    
    @IBOutlet weak var labelPlayerOne: UILabel!
    @IBOutlet weak var labelPlayerTwo: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var gameCells = [GameBlock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0 ..< 9 {
            gameCells.append(GameBlock(occupant: .None))
        }

        collectionView.register(UINib(nibName: "GameCell", bundle: nil), forCellWithReuseIdentifier: "GameCell")

        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension MainViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as! GameCell
        cell.setCell()
        
        return cell
    }
}
