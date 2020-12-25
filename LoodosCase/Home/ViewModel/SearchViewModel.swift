//
//  SearchViewModel.swift
//  LoodosCase
//
//  Created by Onur Karakuş on 24.12.2020.
//

import Foundation
import UIKit
class SearchViewModel {
    
    private var search: [Search] = []
    
    func searchRequest(text: String, complition: @escaping (Bool)->()) {
        HUDHelper.showHud(text: "", alphaValue: 0.0)
        NetworkClient.search(searchText: text) { [weak self] (error, response) in
            HUDHelper.hideHud()
            guard let self = self else { return }
            guard error == nil else {
                complition(false)
                return
            }
            guard let search = response?.search else {
                complition(!(response?.search?.isEmpty ?? true))
                return
            }
            self.search = search
            complition(true)
        }
    }
    
    
    var movieCount: Int {
        return search.count
    }
    
    func searchCellViewModel(indexpath: IndexPath) -> SearchTableViewCell.ViewModel {
        return SearchTableViewCell.ViewModel(data: search[indexpath.row])
    }
    
    func clearSearch() {
        self.search.removeAll()
    }
    
}
