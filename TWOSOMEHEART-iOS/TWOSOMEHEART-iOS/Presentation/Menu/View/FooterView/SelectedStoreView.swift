//
//  SelectedStoreView.swift
//  TWOSOMEHEART-iOS
//
//  Created by RAFA on 11/28/24.
//

import UIKit

final class SelectedStoreView: BaseView {

    // MARK: - UI Properties

    private let storeTitleLabel = UILabel()
    private let storeNameLabel = UILabel()
    private let storeDistanceLabel = UILabel()
    private let changeStoreButton = UIButton(type: .system)

    // MARK: - UI

    override func setStyle() {
        self.do {
            $0.backgroundColor = .tsBlack
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 16
            $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }

        storeTitleLabel.setLabel(
            text: SLSelectedStore.title,
            alignment: .left,
            numberOfLines: 1,
            textColor: .tsWhite,
            font: TSFont.c1r
        )

        storeNameLabel.setLabel(
            text: SLSelectedStore.storeName,
            alignment: .left,
            numberOfLines: 1,
            textColor: .tsWhite,
            font: TSFont.b1b
        )

        storeDistanceLabel.setLabel(
            text: SLSelectedStore.distance,
            alignment: .left,
            numberOfLines: 1,
            textColor: .tsWhite,
            font: TSFont.c1s
        )

        changeStoreButton.do {
            var config = UIButton.Configuration.plain()
            config.contentInsets = .init(top: 3, leading: 10, bottom: 3, trailing: 10)

            $0.configuration = config
            $0.setTitle(SLSelectedStore.change, for: .normal)
            $0.tintColor = .tsWhite
            $0.titleLabel?.font = TSFont.b2r
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 2
            $0.layer.borderColor = UIColor.tsWhite.cgColor
            $0.layer.borderWidth = 1
        }
    }

    override func setHierarchy() {
        addSubviews(
            storeTitleLabel,
            storeNameLabel,
            storeDistanceLabel,
            changeStoreButton
        )
    }

    override func setLayout() {
        storeTitleLabel.snp.makeConstraints {
            $0.top.leading.equalTo(16)
        }

        storeNameLabel.snp.makeConstraints {
            $0.top.equalTo(storeTitleLabel.snp.bottom)
            $0.leading.equalTo(storeTitleLabel)
            $0.bottom.equalTo(-54)
        }

        storeDistanceLabel.snp.makeConstraints {
            $0.centerY.equalTo(storeNameLabel)
            $0.leading.equalTo(storeNameLabel.snp.trailing).offset(8)
        }

        changeStoreButton.snp.makeConstraints {
            $0.centerY.equalTo(storeNameLabel.snp.top)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(28)
        }
    }
}
