//
//  SearchResultVC-Extension-CollectionViewDataSource.swift
//  RetoLiverpool
//
//  Created by Carlos Carrera Reyes on 26/12/18.
//  Copyright © 2018 Carlos Carrera Reyes. All rights reserved.
//

import UIKit

extension SearchResultVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cvProducts.dequeueReusableCell(withReuseIdentifier: "cellProduct", for: indexPath) as! CellProduct
        cell.backgroundColor = UIColor.white
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowOffset = CGSize(width: -1, height: 1)
        cell.layer.shadowRadius = 1
        cell.layer.shouldRasterize = true
        cell.ivProduct.downloaded(from: listProducts[indexPath.row].imageP)
        cell.lblTitle.text = listProducts[indexPath.row].title
        cell.lblPrice.text = "$\(listProducts[indexPath.row].price)"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/2.0-10
        let yourHeight = yourWidth
        
        return CGSize(width: yourWidth, height: yourHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
}
