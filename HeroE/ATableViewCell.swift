
import UIKit
import Hero

class ATableViewCell: UITableViewCell {
    weak var vc: UIViewController?
    @IBOutlet var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}


extension ATableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoverCell", for: indexPath) as? CoverCell else {
            return UICollectionViewCell()
        }
        let color = UIColor(hue: CGFloat(indexPath.row) / 30, saturation: 0.68,
                                  brightness: 0.98, alpha: 1)
        cell.imageView.backgroundColor = color
        cell.imageView.hero.id = "cell\(indexPath.item)"
        cell.imageView.hero.modifiers = [.fade, .scale(0.8)]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let s = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "CollViewController") as!  CollViewController
        s.hero.isEnabled = true
        s.data = indexPath.item

        s.modalPresentationStyle = .overFullScreen

        s.heroModalAnimationType = .fade
        vc?.present(s, animated: true, completion: nil)

    }
}

extension ATableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 140)
    }
}


extension ViewController: HeroViewControllerDelegate {
  func heroWillStartAnimatingTo(viewController: UIViewController) {


  }

  func heroWillStartAnimatingFrom(viewController: UIViewController) {
    if viewController is CollViewController {
        let cell = tableView.cellForRow(at: IndexPath.init(row: 0, section: 0))! as? ATableViewCell
        let index = IndexPath.init(item: 0, section: 0)
        cell?.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
    }
  }
}
