//
//  MenuOptionShotCell.swift
//  TWOSOMEHEART-iOS
//
//  Created by RAFA on 11/20/24.
//

import UIKit

final class MenuOptionShotCell: BaseTableViewCell {

    // MARK: - UI Properties

    private let densityLabel = UILabel()

    private lazy var customSegmentControlView: CustomSegmentControlView = {
        let buttons = ["기본", "연하게"].map { title in
            UIButton().then {
                $0.setTitle(title, for: .normal)
            }
        }

        let control = CustomSegmentControlView(
            buttons: buttons,
            segmentType: .option
        )

        return control
    }()

    private let addShotLabel = UILabel()

    let counterView = CounterView(counterType: .option)

    // MARK: - Properties

    weak var priceDelegate: PriceUpdateDelegate?

    // MARK: - Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        updatePriceForCounterChange()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Actions

    private func updatePriceForCounterChange() {
        counterView.onValueChanged = { [weak self] count in
            guard let self = self else { return }

            self.priceDelegate?.priceDidChange(
                section: 0,
                itemIndex: 0,
                count: count
            )
        }
    }

    // MARK: - UI

    override func setStyle() {
        densityLabel.do {
            $0.setLabel(
                text: "농도",
                alignment: .left,
                numberOfLines: 1,
                textColor: .gray90,
                font: TSFont.b2s
            )
        }

        addShotLabel.do {
            $0.setAttributedText(
                fullText: "샷 추가 (+1에 500원)",
                styles: [
                    (text: "샷 추가", font: TSFont.b2s, color: .gray90),
                    (text: "(+1에 500원)", font: TSFont.c2b, color: .gray60)
                ]
            )

            $0.textAlignment = .left
        }

        counterView.do {
            $0.backgroundColor = .tsWhite
        }
    }

    override func setHierarchy() {
        contentView.addSubviews(
            densityLabel,
            customSegmentControlView,
            addShotLabel,
            counterView
        )
    }

    override func setLayout() {
        densityLabel.snp.makeConstraints {
            $0.top.equalTo(16)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }

        customSegmentControlView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(densityLabel.snp.bottom).offset(5)
            $0.leading.equalTo(densityLabel)
            $0.height.equalTo(38)
        }

        addShotLabel.snp.makeConstraints {
            $0.top.equalTo(customSegmentControlView.snp.bottom).offset(31)
            $0.leading.equalTo(customSegmentControlView)
        }

        counterView.snp.makeConstraints {
            $0.centerY.equalTo(addShotLabel)
            $0.leading.greaterThanOrEqualTo(addShotLabel.snp.trailing).offset(10)
            $0.bottom.equalTo(-25)
            $0.trailing.equalTo(customSegmentControlView)
            $0.width.equalTo(104)
            $0.height.equalTo(32)
        }
    }
}
