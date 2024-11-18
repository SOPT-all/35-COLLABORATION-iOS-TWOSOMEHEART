//
//  UILabel+.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/18/24.
//

import UIKit

extension UILabel {
    
    func setLabel(text: String? = "",
                  alignment: NSTextAlignment = .center,
                  numberOfLines: Int = 0,
                  textColor: UIColor,
                  font: UIFont) {
        self.text = text
        self.textAlignment = alignment
        self.numberOfLines = numberOfLines
        self.textColor = textColor
        self.font = font
    }
    
}
