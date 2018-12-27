//
//  SearchVC-Extension-SearchBarDelegate.swift
//  RetoLiverpool
//
//  Created by Carlos Carrera Reyes on 26/12/18.
//  Copyright © 2018 Carlos Carrera Reyes. All rights reserved.
//
import UIKit

extension SearchVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        print(text.debugDescription)
        if text.description=="\n"{return true}
        let characterSet = CharacterSet(charactersIn: text)
        let alowedCharacters = CharacterSet.alphanumerics.union(.whitespaces)
        return alowedCharacters.isSuperset(of: characterSet)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //Hide Keyboard
        self.view.endEditing(true)
        //Show activityIndicator
        activityLoad(message: "Buscando")
        serviceSearch.setSearchHistory(searchSave: searchBar.text!)
        arrSearcHistory = serviceSearch.getSearchHistory().reversed()
        tvSearchHistory.reloadData()
        tvSearchHistory.separatorStyle = arrSearcHistory.isEmpty ? .none : .singleLine
        serviceSearch.getSearchResult(textSearch: searchBar.text!.replacingOccurrences(of: " ", with: ""), completion: { (products) in
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
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}
