//
//  ServiceSearch.swift
//  RetoLiverpool
//
//  Created by Carlos Carrera Reyes on 26/12/18.
//  Copyright © 2018 Carlos Carrera Reyes. All rights reserved.
//

import Alamofire
import ObjectMapper

class ServiceSearch {
    /**
     * Method name: getSearchResult
     * Description: This method brings the results of a search with the Liverpool API from a String
     * Parameters: textSearch: The search criteria
     */
    func getSearchResult(textSearch:String ,completion:@escaping ([Product]) -> Void, failure:@escaping (Int, String) -> Void) -> Void{
        let url = URL(string: "https://shoppapp.liverpool.com.mx/appclienteservices/services/v2/plp?search-string=\(textSearch)")
        Alamofire.request(url!, method: .get)
            .validate()
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error: \(String(describing: response.result.error))")
                    failure(0,"Error response")
                    return
                }
                if let responseJSON = response.result.value as? [String: Any] {
                    guard let searchResult:Result = Mapper<Result>().map(JSON: responseJSON) else {
                        print("error")
                        failure(0,"Error mapping response")
                        return
                    }
                    if let plpR = searchResult.plpResults{
                        if let products = plpR.records{
                            completion(products)
                            return
                        }
                    }else{
                        print("error")
                        failure(0,"Error getting products")
                        return
                    }
                }else{
                    print("error")
                    failure(0,"Error reading response")
                    return
                }
    }
    }
    /**
     * Method name: setSearchHistory
     * Description: This method set a new element in the search history(Only saves the last 10 elements)
     * Parameters: searchSave: String element to save in search history
     */
    func setSearchHistory(searchSave: String){
        if let arrSave = UserDefaults.standard.value(forKey: "arraySearcHistory") {
            if var arrUpdate = arrSave as? [String]{
                if !arrUpdate.contains(searchSave){
                    if arrUpdate.count == 10{
                        arrUpdate.removeFirst()
                        arrUpdate.append(searchSave)
                    UserDefaults.standard.set(arrUpdate, forKey: "arraySearcHistory")
                    }else{
                        arrUpdate.append(searchSave)
                        UserDefaults.standard.set(arrUpdate, forKey: "arraySearcHistory")
                    }
                }
            }
        } else {
            let arrAux: [String] = [searchSave]
            UserDefaults.standard.set(arrAux, forKey: "arraySearcHistory")
        }
    }
    func getSearchHistory()->[String]{
        if let arrSave = UserDefaults.standard.value(forKey: "arraySearcHistory") {
            if let arrSearcHistory = arrSave as? [String]{
            return arrSearcHistory
            }
        }
        return []
    }
}
