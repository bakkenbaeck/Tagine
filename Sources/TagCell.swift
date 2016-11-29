import UIKit

protocol TagCellDelegate: class {
    func tagCell(_ tagCell: TagCell, didUpdateWidth width: CGFloat)
    func tagCellDidPressDelete(_ tagCell: TagCell)
}

class TagCell: UICollectionViewCell {
    static let margin = CGFloat(10.0)
    weak var delegate: TagCellDelegate?

    var tag: String?  {
        didSet {
            self.textLabel.text = title
            self.textLabel.sizeToFit()
            self.updateConstraints()
            self.delegate?.tagCell(self, didUpdateWidth: self.tagCellWidth)
        }
    }

    lazy var textLabel: UILabel = {
        let label = UILabel(withAutoLayout: true)
        label.font = .book(16)
        label.textColor = UIColor.darkGrayish().withAlphaComponent(0.6)

        return label
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
