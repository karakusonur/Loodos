//
//  DetailViewController.swift
//  LoodosCase
//
//  Created by Onur Karakuş on 24.12.2020.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {

    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var navTitleLabel: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    
    var movieText = ""
    var viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        request()
    }
    
    func request () {
        viewModel.detailRequest(text: movieText) { [weak self] details in
            guard let self = self else { return }
            self.setValues(detail: details)
        }
    }
    
    @IBAction func backAct(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setValues(detail: DetailModel) {
        actorsLabel.text = detail.actors
        titleLabel.text = detail.title
        navTitleLabel.text = detail.title
        yearLabel.text = detail.year
        genreLabel.text = detail.genre
        ratingLabel.text = detail.imdbRatings
        if let photo = detail.image {
            detailImage.kf.setImage(with: URL(string: photo),
                                    placeholder: nil,
                                    options: [.transition(ImageTransition.none)],
                                    progressBlock: nil,
                                    completionHandler: { image, error, cacheType, imageURL in
                                    })
        }
        
    }
}
