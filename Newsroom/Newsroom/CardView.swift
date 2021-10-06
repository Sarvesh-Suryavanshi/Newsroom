//
//  CardView.swift
//  Newsroom
//
//  Created by Sarvesh Suryavanshi on 06/10/21.
//

import UIKit

@IBDesignable
class CardView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 8.0
    @IBInspectable var shadowOffsetWidth: CGFloat = 0.5
    @IBInspectable var shadowOffsetHeight: CGFloat = 0.5
    @IBInspectable var shadowColor: CGColor? = UIColor.gray.cgColor
    @IBInspectable var shadowOpacity: Float = 0.3
    @IBInspectable var shadowRadius: CGFloat = 5.0

    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowColor = shadowColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
}
