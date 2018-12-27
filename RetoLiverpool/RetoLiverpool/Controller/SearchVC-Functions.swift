//
//  SearchVC-Functions.swift
//  RetoLiverpool
//
//  Created by Carlos Carrera Reyes on 26/12/18.
//  Copyright © 2018 Carlos Carrera Reyes. All rights reserved.
//
import UIKit
extension SearchVC{
    func drawUserInterface(){
        //************* DrawSearchBar *************
        searchBar = UISearchBar(frame: CGRect(x: 0, y: screenSize.width*0.22, width: screenSize.width, height: screenSize.width*0.15))
        searchBar.placeholder = "¿Qué estás buscando?"
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.tintColor = UIColor(red: 249.0 / 255.0, green: 0.0 / 255.0, blue: 154.0 / 255.0, alpha: 1.0)
        self.view.addSubview(searchBar)
        tvSearchHistory = UITableView(frame: CGRect(x: 0, y: screenSize.width*0.37 , width: screenSize.width, height: screenSize.height*0.8))
        tvSearchHistory.register(CellHistorySearch.self, forCellReuseIdentifier: "cellSH")
        tvSearchHistory.delegate = self
        tvSearchHistory.dataSource = self
        tvSearchHistory.separatorStyle = arrSearcHistory.isEmpty ? .none : .singleLine
        self.view.addSubview(tvSearchHistory)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProducts" {
            if let sr = segue.destination as? SearchResultVC {
            sr.listProducts = arrProducts
            }
        }
    }
    /**
     * Method name: Show Alert
     * Description: This method show a default iOS alert
     * Parameters: title: title of your alert message: message to show in your alert
     */
    func showAlert(title: String,message: String){
        self.boxView.removeFromSuperview()
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    /**
     * Method name: ActivityLoad
     * Description: This method show an activity indicator along with a message
     * Parameters: message: Message shows along with de activity indicator
     */
    func activityLoad(message: String) {
        boxView = UIView(frame: CGRect(x: view.frame.midX - 90, y: view.frame.midY - 25, width: 180, height: 50))
        boxView.backgroundColor = UIColor.gray
        boxView.alpha = 0.8
        boxView.layer.cornerRadius = 10
        
        //Here the spinnier is initialized
        let activityView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.white)
        activityView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activityView.startAnimating()
        
        let textLabel = UILabel(frame: CGRect(x: 60, y: 0, width: 200, height: 50))
        textLabel.textColor = UIColor.white
        textLabel.text = message
        
        boxView.addSubview(activityView)
        boxView.addSubview(textLabel)
        
        view.addSubview(boxView)
    }
}
