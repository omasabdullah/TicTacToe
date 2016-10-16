import UIKit

class MainViewController : UIViewController {
    
    @IBOutlet weak var labelPlayerOne: UILabel!
    @IBOutlet weak var labelPlayerTwo: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: "GameCell", bundle: nil), forCellWithReuseIdentifier: "GameCell")
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    var gameHandler = GameHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameHandler.resetGame()
    }
    
    func updateScore() {
        labelPlayerOne.text = "Player 1: \(gameHandler.playerOneWins)"
        labelPlayerTwo.text = "Player 2: \(gameHandler.playerTwoWins)"
    }
}

extension MainViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameHandler.gameSpace.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as! GameCell
        cell.setCell(gameSpace: gameHandler.gameSpace[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        gameHandler.gameSpace[indexPath.row].occupant = gameHandler.currentPlayerTurn()
        gameHandler.nextTurn()
        collectionView.reloadData()
    }
}
