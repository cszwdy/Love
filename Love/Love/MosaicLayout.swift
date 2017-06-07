////
////  MosaicCollectionViewLayout.swift
////  Love
////
////  Created by Emiaostein on 08/05/2017.
////  Copyright © 2017 emiaostein. All rights reserved.
////
//
//import UIKit
//import AsyncDisplayKit
//
//protocol MosaicViewLayoutDelegate: ASCollectionDelegate {
//    func collectionView(_ collectionView: UICollectionView, layout: MosaicViewLayout, constraintWidth:CGFloat, heightAtIndexPath: IndexPath) -> CGFloat
//}
//
//class MosaicViewLayout: UICollectionViewLayout {
//    
//    var delegate: MosaicViewLayoutDelegate?
//    
//    private var numberOfColumns = 2
//    private var sectionInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
//    private var itemSpacing: CGFloat = 42
//    private var lineSpacing: CGFloat = 16
//    private var headerHeight: CGFloat = 0
//    
//    // calculate
//    private var itemsAttributes = [[UICollectionViewLayoutAttributes]]()
//    private var headerAttributes = [UICollectionViewLayoutAttributes]()
//    private var columnHeights = [[CGFloat]]()
//    private var columnWidths = [[CGFloat]]()
//    private var sectionHeights = [CGFloat]()
//    private var contentSize = CGSize.zero
//    
//    override func prepare() {
//        super.prepare()
//        print(#function)
//        guard let c = collectionView else { return }
//        
//        itemsAttributes = []
//        headerAttributes = []
//        sectionHeights = []
//        columnHeights = []
//
//        var top = sectionInsets.top //  top move down
//        
//        for s in 0..<c.numberOfSections { // section
//            if headerHeight > 0 {
//                let header = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, with: IndexPath(row: 0, section: s))
//                let headerWidth = c.bounds.width - sectionInsets.left - sectionInsets.right
//                header.frame = CGRect(x: sectionInsets.left, y: top + sectionInsets.top, width: headerWidth, height: headerHeight)
//                
//                headerAttributes.append(header)
//                top += headerHeight  // top move down
//            }
//            columnHeights.append(Array(repeating: top, count: numberOfColumns)) // each column height
//            itemsAttributes.append([])
//            
////            let columnWidth: CGFloat = (c.bounds.width - sectionInsets.left - sectionInsets.right - CGFloat((numberOfColumns - 1)) * lineSpacing) / CGFloat(numberOfColumns)
//            for i in 0..<c.numberOfItems(inSection: s) { // item
//                let indexPath = IndexPath(item: i, section: s)
//                let shortest = columnHeights[s].reduce(columnHeights[s].first!) {return min($0.0, $0.1)}
//                let columnIdx = columnHeights[s].index(of: shortest)!
//                
//                let itemSize = _itemSizeAtIndexPath(indexPath: indexPath)
//                let w: CGFloat = itemSize.width
//                let h: CGFloat = itemSize.height
//                let x: CGFloat = sectionInsets.left + (w + lineSpacing) * CGFloat(columnIdx)
//                let y: CGFloat = shortest + itemSpacing
//                
//                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
//                attributes.frame = CGRect(x: x, y: y, width: w, height: h)
//                itemsAttributes[s].append(attributes)
//                columnHeights[s][columnIdx] = attributes.frame.maxY // save the new column height
//
//            }
//            
//            let tallest = columnHeights[s].reduce(columnHeights[s].first!) {return max($0.0, $0.1)}
//            top = tallest + sectionInsets.bottom // top move down
//        }
//        contentSize = CGSize(width: c.bounds.width, height: top - sectionInsets.bottom)
//    }
//    
//    override var collectionViewContentSize: CGSize {
//        return contentSize
//    }
//    
//    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        
//        var result = [UICollectionViewLayoutAttributes]()
//        let header = headerAttributes.filter{$0.frame.intersects(rect)}
//        result.append(contentsOf: header)
//        let items = itemsAttributes.flatMap{i in i.filter{j in j.frame.intersects(rect)}}
//        result.append(contentsOf: items)
//        return result
//    }
//    
//    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
//        guard indexPath.section < itemsAttributes.count || indexPath.item < itemsAttributes[indexPath.section].count else {
//            return nil
//        }
//        
//        return itemsAttributes[indexPath.section][indexPath.item]
//    }
//    
//    override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
//        guard  indexPath.section < headerAttributes.count else {
//            return nil
//        }
//        
//        return headerAttributes[indexPath.section]
//    }
//    
//    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool { // re-update layout
//        guard let c = collectionView else { return false }
//        if !c.bounds.size.equalTo(newBounds.size) {
//            return false
//        } else {
//            return false
//        }
//    }
//    
//    func _widthForSection (section: Int) -> CGFloat
//    {
//        return self.collectionView!.bounds.size.width - sectionInsets.left - sectionInsets.right;
//    }
//    
//    func _columnWidthForSection(section: Int) -> CGFloat
//    {
//        return (self._widthForSection(section: section) - ((CGFloat(numberOfColumns - 1)) * lineSpacing)) / CGFloat(numberOfColumns)
//    }
//    
//    func _itemSizeAtIndexPath(indexPath: IndexPath) -> CGSize
//    {
//        let width = _columnWidthForSection(section: indexPath.section)
////        var size = CGSize(width: self._columnWidthForSection(section: indexPath.section), height: 0)
//        let height = self.delegate!.collectionView(self.collectionView!, layout:self, constraintWidth: width ,heightAtIndexPath:indexPath)
////        if (originalSize.height > 0 && originalSize.width > 0) {
////            size.height = originalSize.height / originalSize.width * size.width
////        }
//        return CGSize(width: width, height: height)
//    }
//}
//
//class MosaicLayoutInspector: NSObject, ASCollectionViewLayoutInspecting {
//    func collectionView(_ collectionView: ASCollectionView, constrainedSizeForNodeAt indexPath: IndexPath) -> ASSizeRange {
//        let layout = collectionView.collectionViewLayout as! MosaicViewLayout
//        return ASSizeRangeMake(CGSize.zero, layout._itemSizeAtIndexPath(indexPath: indexPath))
//    }
//    
//    func scrollableDirections() -> ASScrollDirection {
//        return ASScrollDirectionVerticalDirections;
//    }
//}
