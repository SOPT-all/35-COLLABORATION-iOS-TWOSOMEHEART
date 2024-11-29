//
//  MenuOptionDrizzleCell.swift
//  TWOSOMEHEART-iOS
//
//  Created by RAFA on 11/20/24.
//

import UIKit

final class MenuOptionDrizzleCell: BaseTableViewCell {

    // MARK: - UI Properties

    private let caramelLabel = UILabel()
    let caramelCounterView = CounterView(counterType: .option)

    private let chocolateLabel = UILabel()
    let chocolateCounterView = CounterView(counterType: .option)

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

    // MARK: - Helpers

    private func updatePriceForCounterChange() {
        caramelCounterView.onValueChanged = { [weak self] count in
            guard let self = self else { return }

            self.priceDelegate?.priceDidChange(
                section: 3,
                itemIndex: 0,
                count: count
            )
        }

        chocolateCounterView.onValueChanged = { [weak self] count in
            guard let self = self else { return }

            self.priceDelegate?.priceDidChange(
                section: 3,
                itemIndex: 1,
                count: count
            )
        }
    }

    // MARK: - UI

    override func setStyle() {
        caramelLabel.do {
            $0.setAttributedText(
                fullText: "\(SLMenuOption.caramelDrizzle) \(SLMenuOption.pricePerPlusOne)",
                styles: [
                    (text: SLMenuOption.caramelDrizzle, font: TSFont.b2s, color: .gray90),
                    (text: SLMenuOption.pricePerPlusOne, font: TSFont.c2b, color: .gray60)
                ]
            )

            $0.textAlignment = .left
        }

        chocolateLabel.do {
            $0.setAttributedText(
                fullText: "\(SLMenuOption.chocolateDrizzle) \(SLMenuOption.pricePerPlusOne)",
                styles: [
                    (text: SLMenuOption.chocolateDrizzle, font: TSFont.b2s, color: .gray90),
                    (text: SLMenuOption.pricePerPlusOne, font: TSFont.c2b, color: .gray60)
                ]
            )

            $0.textAlignment = .left
        }

        [caramelCounterView, chocolateCounterView].forEach {
            $0.backgroundColor = .tsWhite
        }
    }

    override func setHierarchy() {
        contentView.addSubviews(
            caramelLabel,
            caramelCounterView,
            chocolateLabel,
            chocolateCounterView
        )
    }

    override func setLayout() {
        caramelLabel.snp.makeConstraints {
            $0.top.equalTo(22)
            $0.leading.equalTo(16)
        }

        caramelCounterView.snp.makeConstraints {
            $0.centerY.equalTo(caramelLabel)
            $0.leading.greaterThanOrEqualTo(caramelLabel.snp.trailing).offset(10)
            $0.trailing.equalTo(-16)
            $0.width.equalTo(104)
            $0.height.equalTo(32)
        }

        chocolateLabel.snp.makeConstraints {
            $0.top.equalTo(caramelLabel.snp.bottom).offset(32)
            $0.leading.equalTo(caramelLabel)
        }

        chocolateCounterView.snp.makeConstraints {
            $0.centerY.equalTo(chocolateLabel)
            $0.leading.greaterThanOrEqualTo(chocolateLabel.snp.trailing).offset(10)
            $0.bottom.equalTo(-20)
            $0.trailing.equalTo(caramelCounterView)
            $0.width.equalTo(104)
            $0.height.equalTo(32)
        }
    }
}

// MARK: - ResetCounterDelegate

extension MenuOptionDrizzleCell: ResetCounterDelegate {

    func resetCounters() {
        caramelCounterView.resetCounter()
        chocolateCounterView.resetCounter()
    }
}
