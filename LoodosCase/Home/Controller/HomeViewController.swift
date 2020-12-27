//
//  HomeViewController.swift
//  LoodosCase
//
//  Created by Onur Karakuş on 24.12.2020.
//

import UIKit

class HomeViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    var timer: Timer?
    var viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.autocorrectionType = .no
        searchTextField.tintColor = .white
        registerCell()
    }
    
    private func registerCell() {
        tableView.register(cellType: SearchTableViewCell.self)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        timer?.invalidate()  // Cancel any previous timer
        
        let currentText = searchTextField.text ?? ""
        let textCount = (currentText as NSString).replacingCharacters(in: range, with: string).count
        if  textCount >= 3 {
            timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(performSearch), userInfo: nil, repeats: false)
        } else if textCount == 0 {
            viewModel.clearSearch()
            self.tableView.reloadData()
        }
        
        return true
    }
    
    @objc func performSearch() {
        viewModel.searchRequest(text: searchTextField.text!) { [weak self] isEmpty in
            guard let self = self else { return }
            guard isEmpty else {
                self.createDefaultAlert(title: AppConstant.warning, message: AppConstant.notMovie)
                return
            }
            
            self.tableView.reloadData()
        }
    }
    
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        cell.configureCell(viewModel: viewModel.searchCellViewModel(indexpath: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        let index = viewModel.searchCellViewModel(indexpath: indexPath)
        detailVC.movieText = index.title
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
}
