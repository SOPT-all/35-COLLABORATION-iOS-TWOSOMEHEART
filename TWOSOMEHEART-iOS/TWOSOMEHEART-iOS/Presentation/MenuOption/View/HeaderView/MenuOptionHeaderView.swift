//
//  MenuOptionHeaderView.swift
//  TWOSOMEHEART-iOS
//
//  Created by RAFA on 11/20/24.
//

import UIKit

import SnapKit
import Then

protocol MenuOptionHeaderViewDelegate: AnyObject {
    func didTapHeader(section: Int)
}

final class MenuOptionHeaderView: UITableViewHeaderFooterView {

    // MARK: - UI Properties

    private let titleLabel = UILabel()
    private let priceLabel = UILabel()
    private let currencyUnitLabel = UILabel()
    private let priceStackView = UIStackView()
    private let arrowImageView = UIImageView()
    private let addedOptionLabel = UILabel()

    // MARK: - Initializers

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        setStyle()
        setHierarchy()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Helpers

    func configure(_ item: MenuOptionHeader) {
        titleLabel.text = item.title
        updateTitleFont(isExpanded: item.isExpanded)
        updateArrowImage(isExpanded: item.isExpanded)
        updatePrice(price: item.price)
        addedOptionLabel.text = item.addedOptions
    }

    // MARK: - UI

    private func setStyle() {
        titleLabel.do {
            $0.setLabel(
                textColor: .tsBlack,
                font: TSFont.h3r
            )
        }

        priceLabel.do {
            $0.setLabel(
                numberOfLines: 1,
                textColor: .gray80,
                font: TSFont.b1b
            )
        }

        currencyUnitLabel.do {
            $0.setLabel(
                text: "원",
                numberOfLines: 1,
                textColor: .gray80,
                font: TSFont.b1b
            )
        }

        priceStackView.do {
            $0.addArrangedSubviews([priceLabel, currencyUnitLabel])
            $0.setStackView(distribution: .fillProportionally)
        }

        arrowImageView.do {
            $0.image = UIImage(resource: .optionArrowDown)
            $0.tintColor = .tsBlack
        }

        addedOptionLabel.do {
            $0.setLabel(
                alignment: .left,
                textColor: .gray70,
                font: TSFont.c2r
            )
        }
    }

    private func setHierarchy() {
        contentView.addSubviews(
            titleLabel,
            priceStackView,
            arrowImageView,
            addedOptionLabel
        )
    }

    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(6)
            $0.leading.equalTo(16)
        }

        priceStackView.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalTo(arrowImageView.snp.leading).offset(-10)
        }

        arrowImageView.snp.makeConstraints {
            $0.centerY.equalTo(priceStackView)
            $0.trailing.equalTo(-16)
        }

        addedOptionLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.equalTo(titleLabel)
            $0.bottom.equalTo(-12)
            $0.height.equalTo(18)
        }
    }
}

// MARK: - Update Methods

private extension MenuOptionHeaderView {

    func updateTitleFont(isExpanded: Bool) {
        titleLabel.font = isExpanded ? TSFont.h3b : TSFont.h3r
    }

    func updateArrowImage(isExpanded: Bool) {
        arrowImageView.image = UIImage(
            resource: isExpanded ? .optionArrowUp : .optionArrowDown
        )
    }

    func updatePrice(price: Int) {
        if price > 0 {
            priceLabel.text = "+ \(price)"
        } else {
            priceLabel.text = "\(price)"
        }
    }
}
