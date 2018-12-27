//
//  SearchVC-Extension-TableViewDataSource.swift
//  RetoLiverpool
//
//  Created by Carlos Carrera Reyes on 26/12/18.
//  Copyright © 2018 Carlos Carrera Reyes. All rights reserved.
//

import UIKit

extension SearchVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSearcHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvSearchHistory.dequeueReusableCell(withIdentifier: "cellSH", for: indexPath) as! CellHistorySearch
        cell.textLabel?.text = arrSearcHistory[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        activityLoad(message: "Buscando")
        serviceSearch.getSearchResult(textSearch: arrSearcHistory[indexPath.row].replacingOccurrences(of: " ", with: ""), completion: { (products) in
        self.arrProducts = products
            if !self.arrProducts.isEmpty{
                self.performSegue(withIdentifier: "showProducts", sender: nil)
                self.boxView.removeFromSuperview()
            }else{
                self.showAlert(title: "Liverpool", message: "La búsquda ingresada no obtuvo ningún resultado")
            }
        }) { (numError, Error) in
            print(Error)
            self.showAlert(title: "Error", message: Error)
        }
    }
}
