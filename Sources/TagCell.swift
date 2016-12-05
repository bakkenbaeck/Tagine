import UIKit

protocol TagCellDelegate: class {
    func tagCell(_ tagCell: TagCell, didUpdateWidth width: CGFloat)
    func tagCellDidPressDelete(_ tagCell: TagCell)
}

class TagCell: UICollectionViewCell {
    static let identifier = "TagCell"

    static func widthFor(tagTitle title: String) -> CGFloat {
        let label =  TagCell.tagCellLabel
        label.text = title
        label.sizeToFit()

        return label.frame.width + (2 * TagCell.margin)
    }

     static var tagCellLabel: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black.withAlphaComponent(0.6)

        return label
    }

    static let margin = CGFloat(10.0)
    weak var delegate: TagCellDelegate?

    var title: String?  {
        didSet {
            self.textLabel.text = title
            self.textLabel.sizeToFit()
            self.updateConstraints()
        }
    }

    lazy var textLabel: UILabel = {
        return TagCell.tagCellLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.layer.masksToBounds = true
        self.layer.cornerRadius = 4

        self.contentView.backgroundColor = UIColor.black.withAlphaComponent(0.05)

        self.addConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addConstraints() {
        self.contentView.addSubview(self.textLabel)

        self.textLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true
        self.textLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true

        self.textLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10).isActive = true
        self.textLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        self.textLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
    }
}
