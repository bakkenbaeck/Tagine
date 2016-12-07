import UIKit

class TagViewFlowLayout: UICollectionViewFlowLayout {
    static let spacing = CGFloat(5.0)

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributes = super.layoutAttributesForElements(in: rect) else { return nil }

        var newAttributes = [UICollectionViewLayoutAttributes]()
        var leftMargin = TagViewFlowLayout.spacing
        var yPosition = CGFloat(0.0)

        for attribute in attributes {
            let attributeCopy = attribute.copy() as! UICollectionViewLayoutAttributes
            var newFrame = attributeCopy.frame
            if yPosition != newFrame.minY {
                leftMargin = TagViewFlowLayout.spacing
                yPosition = newFrame.minY
            }
            newFrame.origin.x = leftMargin
            attributeCopy.frame = newFrame

            leftMargin = leftMargin + attributeCopy.frame.width + TagViewFlowLayout.spacing
            newAttributes.append(attributeCopy)
        }

        return newAttributes
    }
}
