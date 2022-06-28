//
//  SliderPhotosViewController.swift
//  Tinder
//
//  Created by Rodrigo Vart on 01/05/22.
//

import UIKit

class SliderPhotosViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let photosID = "photosID"
    
    let fotos: [String] = [
        "pessoa-1",
        "pessoa-2",
        "pessoa-3",
        "pessoa-4",
        "pessoa-5",
        "pessoa-6",
        "pessoa-7",
        "pessoa-8",
        "pessoa-9",
        "pessoa-10"
    ]
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SliderPhotoCell.self, forCellWithReuseIdentifier: photosID)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fotos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photosID, for: indexPath) as? SliderPhotoCell else {
            return UICollectionViewCell()
        }
        cell.photo.image = UIImage(named: fotos[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let size = collectionView.bounds.height / 2 - 10
      return .init(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 20, bottom: 0, right: 20)
    }
}
