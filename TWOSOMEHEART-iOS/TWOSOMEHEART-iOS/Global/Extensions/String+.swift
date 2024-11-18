//
//  String+.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/17/24.
//

import Foundation

extension String {
    
    // MARK: - 자간설정
    // textView.attributeText = setLetterSpacing(0.3, "body2_sb_13_relax")
    // textView.attributeText = setLetterSpacing(0.3, "caption1_r_12_relax")
    // textView.attributeText = setLetterSpacing(-0.6, "caption1_r_12_relax")
    func setLetterSpacing(_ spacing: CGFloat, _ text: String) -> NSMutableAttributedString {
      let attributedString = NSMutableAttributedString(string: text)
      attributedString.addAttribute(NSAttributedString.Key.kern,
                                    value: spacing,
                                    range: NSRange(location: 0, length: attributedString.length)
      )
      return attributedString
    }
    
}