//
//  Rounded.swift
//  LINQQUP
//
//  Created by Brian Bird on 8/17/17.
//  Copyright © 2017 birdsoftware. All rights reserved.
//

import Foundation

import UIKit

@IBDesignable
class RoundedImageView: UIImageView {
    
    @IBInspectable
    var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            guard let cgColor = layer.borderColor else { return nil }
            return UIColor(cgColor: cgColor)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var radiusMultiplier: CGFloat = 0.5 {
        didSet {
            layer.cornerRadius = bounds.width * radiusMultiplier
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width * radiusMultiplier
    }
    
}

@IBDesignable
class RoundedButton: UIButton {
    
    @IBInspectable
    var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            guard let cgColor = layer.borderColor else { return nil }
            return UIColor(cgColor: cgColor)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var radiusMultiplier: CGFloat = 0.5 {
        didSet {
            layer.cornerRadius = bounds.width * radiusMultiplier
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width * radiusMultiplier
    }
    
}

