//
//  MyButton.swift
//  TWOSOMEHEART-iOS
//
//  Created by RAFA on 11/28/24.
//

import UIKit

import SnapKit
import Then

final class MyButton: UIButton {

    // MARK: - Properties

    private let buttonImageView = UIImageView()

    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)

        setStyle()
        setHierarchy()
        setLayout()
        addShadow()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func layoutSubviews() {
        super.layoutSubviews()

        addShadow()
    }

    // MARK: - UI

    private func setStyle() {
        self.do {
            $0.clipsToBounds = false
            $0.layer.cornerRadius = 27
            $0.backgroundColor = .red40
        }

        buttonImageView.do {
            $0.image = .menuFabMy
            $0.contentMode = .scaleAspectFit
        }
    }

    private func setHierarchy() {
        addSubview(buttonImageView)
    }

    private func setLayout() {
        snp.makeConstraints { $0.size.equalTo(54) }
        buttonImageView.snp.makeConstraints { $0.center.equalToSuperview() }
    }

    private func addShadow() {
        self.layer.do {
            let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 27)
            $0.shadowPath = shadowPath.cgPath
            $0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            $0.shadowOpacity = 1
            $0.shadowRadius = 18
            $0.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
}
