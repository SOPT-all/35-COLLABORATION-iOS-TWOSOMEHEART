//
//  MenuOptionSyrupCell.swift
//  TWOSOMEHEART-iOS
//
//  Created by RAFA on 11/20/24.
//

import UIKit

final class MenuOptionSyrupCell: BaseTableViewCell {

    // MARK: - UI Properties

    private let vanillaLabel = UILabel()
    let vanillaCounterView = CounterView(counterType: .option)

    private let hazelLabel = UILabel()
    let hazelCounterView = CounterView(counterType: .option)

    private let caramelLabel = UILabel()
    let caramelCounterView = CounterView(counterType: .option)

    // MARK: - Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI

    override func setStyle() {
        vanillaLabel.do {
            $0.setAttributedText(
                fullText: "바닐라시럽 (+1에 500원)",
                styles: [
                    (text: "바닐라시럽", font: TSFont.b2s, color: .gray90),
                    (text: "(+1에 500원)", font: TSFont.c2b, color: .gray60)
                ]
            )

            $0.textAlignment = .left
        }

        hazelLabel.do {
            $0.setAttributedText(
                fullText: "헤이즐넛시럽 (+1에 500원)",
                styles: [
                    (text: "헤이즐넛시럽", font: TSFont.b2s, color: .gray90),
                    (text: "(+1에 500원)", font: TSFont.c2b, color: .gray60)
                ]
            )

            $0.textAlignment = .left
        }

        caramelLabel.do {
            $0.setAttributedText(
                fullText: "카라멜시럽 (+1에 500원)",
                styles: [
                    (text: "카라멜시럽", font: TSFont.b2s, color: .gray90),
                    (text: "(+1에 500원)", font: TSFont.c2b, color: .gray60)
                ]
            )

            $0.textAlignment = .left
        }

        [vanillaCounterView, hazelCounterView, caramelCounterView].forEach {
            $0.backgroundColor = .tsWhite
        }
    }

    override func setHierarchy() {
        contentView.addSubviews(
            vanillaLabel, vanillaCounterView,
            hazelLabel, hazelCounterView,
            caramelLabel, caramelCounterView
        )
    }

    override func setLayout() {
        vanillaLabel.snp.makeConstraints {
            $0.top.equalTo(22)
            $0.leading.equalTo(16)
        }

        vanillaCounterView.snp.makeConstraints {
            $0.centerY.equalTo(vanillaLabel)
            $0.leading.greaterThanOrEqualTo(vanillaLabel.snp.trailing).offset(10)
            $0.trailing.equalTo(-16)
            $0.width.equalTo(104)
            $0.height.equalTo(32)
        }

        hazelLabel.snp.makeConstraints {
            $0.top.equalTo(vanillaLabel.snp.bottom).offset(32)
            $0.leading.equalTo(vanillaLabel)
        }

        hazelCounterView.snp.makeConstraints {
            $0.centerY.equalTo(hazelLabel)
            $0.leading.greaterThanOrEqualTo(hazelLabel.snp.trailing).offset(10)
            $0.trailing.equalTo(vanillaCounterView)
            $0.width.equalTo(104)
            $0.height.equalTo(32)
        }

        caramelLabel.snp.makeConstraints {
            $0.top.equalTo(hazelLabel.snp.bottom).offset(32)
            $0.leading.equalTo(hazelLabel)
        }

        caramelCounterView.snp.makeConstraints {
            $0.centerY.equalTo(caramelLabel)
            $0.leading.greaterThanOrEqualTo(caramelLabel.snp.trailing).offset(10)
            $0.bottom.equalTo(-20)
            $0.trailing.equalTo(hazelCounterView)
            $0.width.equalTo(104)
            $0.height.equalTo(32)
        }
    }
}

// MARK: - ResetCounterDelegate

extension MenuOptionSyrupCell: ResetCounterDelegate {

    func resetCounters() {
        vanillaCounterView.resetCounter()
        hazelCounterView.resetCounter()
        caramelCounterView.resetCounter()
    }
}
