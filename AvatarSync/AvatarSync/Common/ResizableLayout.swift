//
//  ResizableLayout.swift
//  AvatarSync
//
//  Created by Roman Litvinovich on 13.08.24.
//

import UIKit

class ResizableLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        scrollDirection = .horizontal
        minimumLineSpacing = Constants.ResizableLayoutConstants.lineSpacing
        itemSize = Constants.ResizableLayoutConstants.itemSize
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else { return }
        let horizontalInsets = (collectionView.bounds.width - itemSize.width) / 2
        collectionView.contentInset = UIEdgeInsets(top: 0, left: horizontalInsets, bottom: 0, right: horizontalInsets)
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let collectionView = collectionView else { return nil }
        let rectAttributes = super.layoutAttributesForElements(in: rect)
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        
        return rectAttributes?.map { attributes in
            let distance = visibleRect.midX - attributes.center.x
            let normalizedDistance = distance / Constants.ResizableLayoutConstants.activeDistance
            if abs(distance) < Constants.ResizableLayoutConstants.activeDistance {
                let zoom = 1 + Constants.ResizableLayoutConstants.zoomFactor * (1 - abs(normalizedDistance))
                attributes.transform3D = CATransform3DMakeScale(zoom, zoom, 1)
                attributes.zIndex = Int(zoom.rounded())
            }
            return attributes
        }
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else { return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity) }
        
        let targetRect = CGRect(x: proposedContentOffset.x, y: 0, width: collectionView.bounds.width, height: collectionView.bounds.height)
        let rectAttributes = super.layoutAttributesForElements(in: targetRect)
        
        let collectionViewMidX = proposedContentOffset.x + collectionView.bounds.width / 2
        let closest = rectAttributes?.sorted {
            abs($0.center.x - collectionViewMidX) < abs($1.center.x - collectionViewMidX)
        }.first ?? UICollectionViewLayoutAttributes()
        
        let targetOffset = CGPoint(x: closest.center.x - collectionView.bounds.width / 2, y: proposedContentOffset.y)
        return targetOffset
    }
}
