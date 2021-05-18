
import Hero
import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    weak var cell: ATableViewCell?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//        let layout = HorizontalCollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.itemSize = CGSize(width: 56, height: 71)
//        layout.minimumLineSpacing = 14
//        layout.minimumInteritemSpacing = itemSpace
//        collectionView.contentInset = UIEdgeInsets(top: 30, left: insetLeft, bottom: 30, right: insetLeft)
//        collectionView.setCollectionViewLayout(layout, animated: false)
//        collectionView.reloadData()
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ATableViewCell", for: indexPath) as! ATableViewCell
        cell.vc = self
        return cell
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }


}

