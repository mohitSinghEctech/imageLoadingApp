//
//  StaggeredLayout.swift
//  ImageLoadingApp
//
//  Created by Mohit Kumar Singh on 08/12/20.
//

import UIKit

protocol StaggeredLayoutDelegate: AnyObject {
  func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat
}

class StaggeredLayout: UICollectionViewLayout {
    
    private var contentWidth: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        let sectionInsets = collectionView.contentInset
        return collectionView.bounds.width - (sectionInsets.left + sectionInsets.right)
    }

    private var frameHolder: StagFlowLayoutFrame = StagFlowLayoutFrame(widthHeightRatios: [(0.5, 0.4), (0.5, 0.9), (0.5, 0.6)], itemSpacing: 4)

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override public var collectionViewContentSize: CGSize {
        return frameHolder.collectionViewContentSize
    }

    override public func prepare() {
        super.prepare()
        guard !frameHolder.prepared, let collectionView = collectionView, collectionView.numberOfSections > 0 else { return }
        frameHolder.prepare(itemCount: collectionView.numberOfItems(inSection: 0), contentWidth: contentWidth)
    }

    override public func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return frameHolder.layoutAttributesForElements(in: rect)
    }

    override public func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return frameHolder.layoutAttributesForItem(at: indexPath)
    }

    override public func invalidateLayout() {
        super.invalidateLayout()
        frameHolder.invalidateLayout()
    }
}
