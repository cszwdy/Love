//
//  MosaicViewLayout.swift
//  Love
//
//  Created by Emiaostein on 28/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

// structure: setction, cell, header, footer

// measure: collectionInset,  sectionInsets, headerHeight ,cellsVerticalSpacing, cellsHoriSpacing, footerHeight

import UIKit

private let defaultItemHorizonSpacing: CGFloat = 16
private let defaultItemVerticalSpacing: CGFloat = 42
private let defaultHeaderHeight: CGFloat = 0
private let defaultFooterHeight: CGFloat = 0
private let defaultColumn = 2

protocol MosaicViewLayoutDelegate: NSObjectProtocol {
    func collectionView(_ collectionView: UICollectionView, layout: MosaicViewLayout, constraintWidth:CGFloat, heightAtIndexPath indexPath: IndexPath) -> CGFloat
}

class MosaicViewLayout: UICollectionViewLayout {

//    var globalInsets: UIEdgeInsets {return collectionView?.contentInset ?? UIEdgeInsets.zero}
    weak var delegate: MosaicViewLayoutDelegate?
    var sectionInsets = UIEdgeInsets(top: 0, left: defaultItemHorizonSpacing, bottom: defaultItemHorizonSpacing, right: defaultItemHorizonSpacing)
    var itemVerticalSpacing: CGFloat = defaultItemVerticalSpacing
    var itemHorizonSpacing: CGFloat = defaultItemHorizonSpacing
    var columns = defaultColumn
    var sections: Int {return collectionView?.numberOfSections ?? 0}
    
    private var _contentSize = CGSize.zero
    private var _columnsHeight: [[CGFloat]] = []
    private var _sectionHeaderHeight: [[CGFloat]] = []
    private var _sectionFooterHeight: [[CGFloat]] = []
    private var _itemsLayoutAttributes: [[UICollectionViewLayoutAttributes]] = []
    private var _headersLayoutAttributes: [[UICollectionViewLayoutAttributes]] = []
    private var _footersLayoutAttributes: [[UICollectionViewLayoutAttributes]] = []
    
    
    override func prepare() {
        super.prepare()
        guard let c = collectionView else { return }
        
        let sCount = sections
        var top = sectionInsets.top // top  0
        let left = sectionInsets.left
        let contentWidth = _contentWidth()
        let columnWidth = _columnWidth()
        
        _columnsHeight = []
        _sectionHeaderHeight = []
        _sectionFooterHeight = []
        _itemsLayoutAttributes = []
        _headersLayoutAttributes = []
        _footersLayoutAttributes = []
        
        for s in 0..<sCount {
            _columnsHeight.append([])
            _sectionHeaderHeight.append([])
            _sectionFooterHeight.append([])
            _itemsLayoutAttributes.append([])
            _headersLayoutAttributes.append([])
            _footersLayoutAttributes.append([])
            
            let sHeaderH = defaultHeaderHeight
            if sHeaderH > 0 {
                let header = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, with: IndexPath(item: 0, section: s))
                header.frame = CGRect(x: left, y: top, width: contentWidth, height: sHeaderH)
                _headersLayoutAttributes[s].append(header)
                _sectionHeaderHeight[s].append(sHeaderH)
            }
            top += sHeaderH // top 2
            let iCount = c.numberOfItems(inSection: s)
            _itemsLayoutAttributes[s].append(contentsOf: (0..<iCount).map{UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: $0, section: s))})
            _columnsHeight[s].append(contentsOf: Array(repeating: CGFloat(top), count: columns))
            
            for i in 0..<iCount {
                let item = _itemsLayoutAttributes[s][i]
                let index = _shortestColumnHeightIndex(at: s)
                let itemHeight = _itemHeight(constrainWidth: columnWidth, item: i, section: s)
                let shortCH = _columnsHeight[s][index]
                
                let x = left + (columnWidth + itemHorizonSpacing) * CGFloat(index)
                let y = shortCH + (shortCH == top ? 0 : itemVerticalSpacing)
                let w = columnWidth
                let h = itemHeight
                
                item.frame = CGRect(x: x, y: y, width: w, height: h)
                
                // save new column height
                _columnsHeight[s][index] = item.frame.maxY
            }
            
            let i = _hightestColumnHeightIndex(at: s)
            let heightestTop = _columnsHeight[s][i]
            let sFooterH = defaultFooterHeight
            if sFooterH > 0 {
                let footer = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, with: IndexPath(item: 0, section: s))
                footer.frame = CGRect(x: left, y: heightestTop, width: contentWidth, height: sFooterH)
                _footersLayoutAttributes[s].append(footer)
                _sectionFooterHeight[s].append(sFooterH)
            }
            
            top = heightestTop + sFooterH + sectionInsets.bottom
        }
        
        _contentSize = CGSize(width: contentWidth, height: top)
    }
    
    private func _contentWidth() -> CGFloat {
        guard let c = collectionView else { return 0 }
        return fabs(c.bounds.width - sectionInsets.left - sectionInsets.right)
    }
    
    private func _columnWidth() -> CGFloat {
        guard collectionView != nil else { return 0 }
        return (_contentWidth() - itemHorizonSpacing * CGFloat((columns - 1))) / CGFloat(columns)
    }
    
    private func _shortestColumnHeightIndex(at section: Int) -> Int {
        let hs = _columnsHeight[section]
        let h = hs.reduce(hs[0]) {min($0.0, $0.1)}
        return hs.index(of: h)!
    }
    
    private func _hightestColumnHeightIndex(at section: Int) -> Int {
        let hs = _columnsHeight[section]
        let h = hs.reduce(hs[0]) {max($0.0, $0.1)}
        return hs.index(of: h)!
    }
    
    private func _itemHeight(constrainWidth width: CGFloat, item: Int, section: Int) -> CGFloat {
        // Delegate get the height
        guard let c = collectionView, let d = delegate else { fatalError("need delegate to get constrain width")}
        return d.collectionView(c, layout: self, constraintWidth: width, heightAtIndexPath: IndexPath(item: item, section: section))
    }

    func itemSize(at indexPath: IndexPath) -> CGSize {
        let w = _columnWidth()
        return CGSize(width: w, height: _itemHeight(constrainWidth: w, item: indexPath.item, section: indexPath.section))
    }
    
    
    override var collectionViewContentSize: CGSize { return _contentSize}
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        guard let c = collectionView else { return false }
        
        return !c.bounds.size.equalTo(newBounds.size)
    }
    
    override func invalidateLayout(with context: UICollectionViewLayoutInvalidationContext) {
        super.invalidateLayout(with: context)
    }
    
    override func invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext {
        let context = super.invalidationContext(forBoundsChange: newBounds)
        return context
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        guard collectionView != nil else {return nil}
        let items = _itemsLayoutAttributes.flatMap{$0}
        let s = items.filter{$0.frame.intersects(rect)}
        return s
 
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return _itemsLayoutAttributes[indexPath.section][indexPath.item]
    }
    override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        switch elementKind {
        case UICollectionElementKindSectionHeader:
            return _headersLayoutAttributes[indexPath.section][indexPath.row]
        case UICollectionElementKindSectionFooter:
            return _footersLayoutAttributes[indexPath.section][indexPath.row]
        default:
            return nil
        }
    }
    
}
