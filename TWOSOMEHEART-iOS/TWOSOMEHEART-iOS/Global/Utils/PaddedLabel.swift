//
//  PaddedLabel.swift
//  TWOSOMEHEART-iOS
//
//  Created by RAFA on 11/28/24.
//

import UIKit

class PaddedLabelView: UILabel {
    
    private var padding: UIEdgeInsets

    init(padding: UIEdgeInsets = .zero) {
        self.padding = padding
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right
        return contentSize
    }

    func setPaddedLabel(
        text: String? = "",
        alignment: NSTextAlignment = .center,
        textColor: UIColor,
        font: UIFont,
        backgroundColor: UIColor? = nil
    ) {
        self.text = text
        self.textAlignment = alignment
        self.textColor = textColor
        self.font = font
        self.backgroundColor = backgroundColor
    }
}
