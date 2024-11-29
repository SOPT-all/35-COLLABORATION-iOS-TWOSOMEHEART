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

    func setAttributedText(
        fullText: String,
        styles: [(text: String, font: UIFont, color: UIColor)]
    ) {
        let attributedString = NSMutableAttributedString(string: fullText)

        styles.forEach { style in
            if let range = fullText.range(of: style.text) {
                let nsRange = NSRange(range, in: fullText)
                attributedString.addAttribute(
                    .font,
                    value: style.font,
                    range: nsRange
                )

                attributedString.addAttribute(
                    .foregroundColor,
                    value: style.color,
                    range: nsRange
                )
            }
        }

        self.attributedText = attributedString
    }

}
