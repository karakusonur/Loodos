//
//  DetailViewModel.swift
//  LoodosCase
//
//  Created by Onur Karakuş on 25.12.2020.
//

import Foundation

class DetailViewModel {
    
    private var detail: DetailModel?
    
    func detailRequest(text: String, complition: @escaping (DetailModel)->()) {
        HUDHelper.showHud(text: "", alphaValue: 0.0)
        NetworkClient.detail(movieName: text) { [weak self] (error, response) in
            HUDHelper.hideHud()
            guard let self = self else { return }
            guard error == nil else {
                return
            }
            guard let detail = response else { return }
            self.detail = detail
            complition(detail)
            
        }
    }
}
