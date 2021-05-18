
import UIKit

class CoverCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
}


class DetailCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var name: UILabel!
}

class HostedViewCollectionViewCell: UICollectionViewCell {

    // MARK: - HostedView

    // 1
    private weak var _hostedView: UIView? {
        didSet {
            if let oldValue = oldValue {
                if oldValue.isDescendant(of: self) { //Make sure that hostedView hasn't been added as a subview to a different cell
                    oldValue.removeFromSuperview()
                }
            }

            if let _hostedView = _hostedView {
                _hostedView.frame = contentView.bounds
                contentView.addSubview(_hostedView)
            }
        }
    }

    // 2
    weak var hostedView: UIView? {
        // 3
        get {
            guard _hostedView?.isDescendant(of: self) ?? false else {
                _hostedView = nil
                return nil
            }

            return _hostedView
        }
        //4
        set {
            _hostedView = newValue
        }
    }

    //Omitted methods
}
