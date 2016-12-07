import UIKit


class DemoCell: UITableViewCell {


    static let reuseIdentifier = "tagViewCell"

    static func heightForTagView(forTags tags: [String]) -> CGFloat {
       return TagineTagViewController.heightForTagView(forTags: tags)
    }

    var tags = [String]() {
        didSet {
            self.tagineViewController.tags = tags
        }
    }

    lazy var tagineViewController: TagineTagViewController = {
       let tagineViewController = TagineTagViewController()
        return tagineViewController
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)


        self.addConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func addConstraints() {
        self.addSubview(self.tagineViewController.view)

        self.tagineViewController.view.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.tagineViewController.view.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
        self.tagineViewController.view.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        self.tagineViewController.view.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
    }
}
