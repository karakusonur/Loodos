//
//  GradiendView.swift
//  EPIAS
//
//  Created by Murat Can Zahmakıran on 8.10.2018.
//  Copyright © 2018 Foreks. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var initialColor: UIColor? {
        didSet {
            guard
                let initialColor = self.initialColor,
                let finalColor = self.finalColor else {
                    return
            }
            (layer as? CAGradientLayer)?.colors = [initialColor.cgColor, finalColor.cgColor]
        }
    }
    
    @IBInspectable var finalColor: UIColor? {
        didSet {
            guard
                let initialColor = self.initialColor,
                let finalColor = self.finalColor else {
                    return
            }
            (layer as? CAGradientLayer)?.colors = [initialColor.cgColor, finalColor.cgColor]
        }
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
}
