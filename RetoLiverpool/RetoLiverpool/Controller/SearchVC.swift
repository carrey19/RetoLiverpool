//
//  SearchVC.swift
//  RetoLiverpool
//
//  Created by Carlos Carrera Reyes on 26/12/18.
//  Copyright © 2018 Carlos Carrera Reyes. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    //Vars&Constants
    var serviceSearch = ServiceSearch()
    let screenSize: CGSize = UIScreen.main.bounds.size
    var arrSearcHistory = [String]()
    var arrProducts = [Product]()
    //Outlets
    var boxView: UIView!
    var searchBar : UISearchBar!
    var tvSearchHistory: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        arrSearcHistory = serviceSearch.getSearchHistory().reversed()
        self.navigationItem.title = "Buscar"
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        drawUserInterface()
    }
}
