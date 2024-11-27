//
//  MenuCell.swift
//  TWOSOMEHEART-iOS
//
//  Created by RAFA on 11/28/24.
//

import UIKit

final class MenuCell: BaseTableViewCell {

    // MARK: - UI Properties

    private let menuImageView = UIImageView()
    private let menuStatusImageView = UIImageView()
    private let menuNameLabel = UILabel()
    private let menuPriceLabel = UILabel()

    // MARK: - Helpers

    func configure(_ item: Menu) {
        menuImageView.image = item.menuImage
        menuStatusImageView.image = item.menuStatus == .new ? .new : .best
        menuNameLabel.text = item.menuTitle

        menuPriceLabel.setAttributedText(
            fullText: "\(item.menuPrice.formattedPrice())원",
            styles: [
                (text: item.menuPrice.formattedPrice(), font: TSFont.b1b, color: .tsBlack),
                (text: "원", font: TSFont.b2r, color: .tsBlack)
            ]
        )
    }

    // MARK: - UI

    override func setStyle() {
        menuImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 4
        }

        menuStatusImageView.contentMode = .scaleAspectFit

        menuNameLabel.setLabel(
            alignment: .left,
            textColor: .tsBlack,
            font: TSFont.b1b
        )

        menuPriceLabel.textAlignment = .left
    }

    override func setHierarchy() {
        contentView.addSubviews(
            menuImageView,
            menuStatusImageView,
            menuNameLabel,
            menuPriceLabel
        )
    }

    override func setLayout() {
        menuImageView.snp.makeConstraints {
            $0.top.equalTo(24)
            $0.leading.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
            $0.size.equalTo(103)
        }

        menuStatusImageView.snp.makeConstraints {
            $0.top.equalTo(menuImageView)
            $0.leading.equalTo(menuImageView.snp.trailing).offset(15)
            $0.height.equalTo(15)
        }

        menuNameLabel.snp.makeConstraints {
            $0.top.equalTo(menuStatusImageView.snp.bottom).offset(1)
            $0.leading.equalTo(menuStatusImageView)
            $0.trailing.equalToSuperview().inset(16)
        }

        menuPriceLabel.snp.makeConstraints {
            $0.top.equalTo(menuNameLabel.snp.bottom).offset(2)
            $0.horizontalEdges.equalTo(menuNameLabel)
            $0.bottom.greaterThanOrEqualTo(menuImageView.snp.bottom).inset(43)
        }
    }
}
