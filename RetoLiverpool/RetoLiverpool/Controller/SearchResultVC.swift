//
//  SearchResultVC.swift
//  RetoLiverpool
//
//  Created by Carlos Carrera Reyes on 26/12/18.
//  Copyright © 2018 Carlos Carrera Reyes. All rights reserved.
//

import UIKit

class SearchResultVC: UIViewController {
    var listProducts = [Product]()
    var cvProducts: UICollectionView!
    let screenSize: CGSize = UIScreen.main.bounds.size
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor(red: 249.0 / 255.0, green: 0.0 / 255.0, blue: 154.0 / 255.0, alpha: 1.0)
        self.navigationItem.title = "Resultados"
        self.navigationController?.isNavigationBarHidden = false
        drawUserInterface()
    }

}
