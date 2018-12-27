//
//  SearchResultVC-Functions.swift
//  RetoLiverpool
//
//  Created by Carlos Carrera Reyes on 26/12/18.
//  Copyright © 2018 Carlos Carrera Reyes. All rights reserved.
//

import UIKit

extension SearchResultVC{
    func drawUserInterface(){
        let flowLayout = UICollectionViewFlowLayout()
        cvProducts = UICollectionView(frame: CGRect(x: screenSize.width*0.05, y:  screenSize.width*0.25, width: screenSize.width*0.9, height: screenSize.height*0.85), collectionViewLayout: flowLayout)
        cvProducts.register(CellProduct.self, forCellWithReuseIdentifier: "cellProduct")
        cvProducts.backgroundColor = UIColor.white
        cvProducts.delegate = self
        cvProducts.dataSource = self
        view.addSubview(cvProducts)
    }
}
