import UIKit

class MainViewController : UIViewController {
    
    @IBOutlet weak var labelPlayerOne: UILabel!
    @IBOutlet weak var labelPlayerTwo: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: "GameCell", bundle: nil), forCellWithReuseIdentifier: "GameCell")
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.backgroundColor = UIColor.black
        }
    }
    
    var gameHandler = GameHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameHandler.delegate = self
        gameHandler.resetGame()
        updateScore()
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
        if gameHandler.gameSpace[indexPath.row].occupant == .none {
            gameHandler.gameSpace[indexPath.row].occupant = gameHandler.currentPlayerTurn()
            gameHandler.nextTurn()
            collectionView.reloadData()
        }
    }
}

extension MainViewController : GameHandlerDelegate {
    func gameEnd(finishString: String) {
        updateScore()
        
        let alertController = UIAlertController(title: "Game Over!", message: finishString, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: {
            alert in
            self.gameHandler.resetGame()
            self.collectionView.reloadData()
        })
        
        alertController.addAction(okayAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
}
