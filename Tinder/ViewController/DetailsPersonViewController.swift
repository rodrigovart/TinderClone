//
//  DetailsPersonViewController.swift
//  Tinder
//
//  Created by Rodrigo Vart on 14/03/22.
//

import Foundation
import UIKit

class DetailsPersonViewController: UICollectionViewController {
    
    var user: User? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    let headerID = "headerID"
    let perfilID = "perfilID"
    let perfilPhotosID = "perfilPhotosID"
    
    init() {
        super.init(collectionViewLayout: HeaderDetailViewLayout())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.register(DetailHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:headerID)
        collectionView.register(DetailPersonCell.self, forCellWithReuseIdentifier: perfilID)
        collectionView.register(DetailPhotosPersonCell.self, forCellWithReuseIdentifier: perfilPhotosID)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: perfilID, for: indexPath) as! DetailPersonCell
            cell.user = user

            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: perfilPhotosID, for: indexPath) as! DetailPhotosPersonCell

            return cell
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! DetailHeaderView
        header.user = user
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.bounds.width, height: view.bounds.height * 0.7)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DetailsPersonViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        var height = UIScreen.main.bounds.height * 0.66

        if indexPath.item == 0 {
            let  cellPerson = DetailPersonCell(frame: CGRect(x: 0, y: 0, width: width, height: height))
            cellPerson.user = user
            cellPerson.layoutIfNeeded()
            
            height = cellPerson.systemLayoutSizeFitting(CGSize(width: width, height: 1000)).height
        }
        
        return .init(width: width, height: height)
    }
}
