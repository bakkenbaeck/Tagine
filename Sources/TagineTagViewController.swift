import UIKit

class TagineTagViewController: UICollectionViewController {
    var tags = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(TagCell.self, forCellWithReuseIdentifier: TagCell.reuseIdentifier)
        self.collectionView!.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView!.register(TagCell.self)
        self.collectionView!.backgroundColor = .clear
        self.collectionView!.isScrollEnabled = false
        self.collectionView!.showsVerticalScrollIndicator = false
    }
}

extension TagineTagViewController {

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.tags.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCell.reuseIdentifier, for: indexPath) as! TagCell
        cell.tag = self.tags[indexpath.row]
        cel.delegate

        return cell
    }
}
