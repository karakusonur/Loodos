//
//  UITableView+Extension.swift
//  iddaa
//
//  Created by Fikri Can Cankurtaran on 1.02.2019.
//  Copyright © 2019 Solid-ICT. All rights reserved.
//

import UIKit

// MARK:- UITableView Extension

extension UITableView {
    
    final func register<T: UITableViewCell>(cellType: T.Type)
        where T: Reusable {
            self.register(cellType.nib, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
    final func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T
        where T: Reusable {
            guard let cell = self.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
                fatalError(
                    "Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) matching type \(cellType.self). "
                        + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                        + "and that you registered the cell beforehand"
                )
            }
            return cell
    }
    
}
