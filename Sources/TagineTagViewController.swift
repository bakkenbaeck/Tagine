import UIKit

class TagineTagViewController: UICollectionViewController {
    var tags: [String]

    init(tags: [String]) {
        self.tags = tags
        super.init(collectionViewLayout: TagViewFlowLayout())

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(TagCell.self, forCellWithReuseIdentifier: TagCell.identifier)
        self.collectionView!.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView!.backgroundColor = .clear
        self.collectionView!.isScrollEnabled = false
        self.collectionView!.showsVerticalScrollIndicator = false

    }
}

extension TagineTagViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let tag = self.tags[indexPath.row]

        let cell = self.collectionView!.cellForItem(at: indexPath)
        return CGSize(width: TagCell.widthFor(tagTitle: tag), height: 44)
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.tags.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCell.identifier, for: indexPath) as! TagCell
        cell.title = self.tags[indexPath.row]

        return cell
    }
}
