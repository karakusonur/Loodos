//
//  SearchTableViewCell.swift
//  LoodosCase
//
//  Created by Onur Karakuş on 24.12.2020.
//

import UIKit
import Kingfisher

class SearchTableViewCell: UITableViewCell, Reusable {

    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var searchImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(viewModel: SearchTableViewCell.ViewModel) {
        title.text = viewModel.title
        year.text = viewModel.year
        searchImage.kf.setImage(with: URL(string: viewModel.imageUrl),
                                placeholder: nil,
                                options: [.transition(ImageTransition.none)],
                                progressBlock: nil,
                                completionHandler: { image, error, cacheType, imageURL in
                                })
        
        
    }
}

extension SearchTableViewCell {
    struct ViewModel {
        var title: String
        var year: String
        var imageUrl: String
    }
}


extension SearchTableViewCell.ViewModel {
    init(data: Search) {
        self.title = data.title ?? ""
        self.year = data.year ?? ""
        self.imageUrl = data.image ?? ""
    }
}
