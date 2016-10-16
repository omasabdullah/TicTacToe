import UIKit

class MainViewController : UIViewController {
    
    @IBOutlet weak var labelPlayerOne: UILabel!
    @IBOutlet weak var labelPlayerTwo: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var gameSpace = [GameSpace]()
    var gameHandler = GameHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0 ..< 9 {
            gameSpace.append(GameSpace())
        }

        collectionView.register(UINib(nibName: "GameCell", bundle: nil), forCellWithReuseIdentifier: "GameCell")

        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func updateScore() {
        labelPlayerOne.text = "Player 1: \(gameHandler.playerOneWins)"
        labelPlayerTwo.text = "Player 2: \(gameHandler.playerTwoWins)"
    }
}

extension MainViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameSpace.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as! GameCell
        cell.setCell(gameSpace: gameSpace[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        gameSpace[indexPath.row].occupant = gameHandler.currentPlayerTurn()
        gameHandler.nextTurn()
        collectionView.reloadData()
    }
}
