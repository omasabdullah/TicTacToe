import UIKit

class MenuViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressPlay(_ sender: AnyObject) {
        let mainVC = MainViewController(nibName: "MainViewController", bundle: nil)
        navigationController?.pushViewController(mainVC, animated: true)
    }
}
