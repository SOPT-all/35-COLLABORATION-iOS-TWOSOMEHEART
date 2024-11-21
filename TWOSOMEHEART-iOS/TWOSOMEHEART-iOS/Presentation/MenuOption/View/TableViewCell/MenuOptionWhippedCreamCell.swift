//
//  MenuOptionWhippedCreamCell.swift
//  TWOSOMEHEART-iOS
//
//  Created by RAFA on 11/20/24.
//

import UIKit

final class MenuOptionWhippedCreamCell: BaseTableViewCell {

    // MARK: - UI Properties

    private let whippedCreamLabel = UILabel()
    let whippedCreamCounterView = CounterView(counterType: .option)

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
        whippedCreamCounterView.onValueChanged = { [weak self] count in
            guard let self = self else { return }

            self.priceDelegate?.priceDidChange(
                section: 2,
                itemIndex: 0,
                count: count
            )
        }
    }

    // MARK: - UI

    override func setStyle() {
        whippedCreamLabel.do {
            $0.setAttributedText(
                fullText: "\(SLMenuOption.whippedCream) \(SLMenuOption.pricePerPlusOne)",
                styles: [
                    (text: SLMenuOption.whippedCream, font: TSFont.b2s, color: .gray90),
                    (text: SLMenuOption.pricePerPlusOne, font: TSFont.c2b, color: .gray60)
                ]
            )

            $0.textAlignment = .left
        }

        whippedCreamCounterView.do {
            $0.backgroundColor = .tsWhite
        }
    }

    override func setHierarchy() {
        contentView.addSubviews(
            whippedCreamLabel,
            whippedCreamCounterView
        )
    }

    override func setLayout() {
        whippedCreamLabel.snp.makeConstraints {
            $0.top.equalTo(22)
            $0.leading.equalTo(16)
        }

        whippedCreamCounterView.snp.makeConstraints {
            $0.centerY.equalTo(whippedCreamLabel)
            $0.leading.greaterThanOrEqualTo(whippedCreamLabel.snp.trailing).offset(10)
            $0.bottom.equalTo(-20)
            $0.trailing.equalTo(-16)
            $0.width.equalTo(104)
            $0.height.equalTo(32)
        }
    }
}

// MARK: - ResetCounterDelegate

extension MenuOptionWhippedCreamCell: ResetCounterDelegate {

    func resetCounters() {
        whippedCreamCounterView.resetCounter()
    }
}
