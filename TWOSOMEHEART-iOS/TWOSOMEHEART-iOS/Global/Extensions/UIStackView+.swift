//
//  UIStackView+.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/18/24.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { self.addArrangedSubview($0) }
    }
    
    func setStackView(axis: NSLayoutConstraint.Axis = .horizontal,
                      distribution: UIStackView.Distribution = .fillEqually,
                      alignment: UIStackView.Alignment = .fill,
                      spacng: Int?) {
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }

}
