//
//  MenuCategoryView.swift
//  TWOSOMEHEART-iOS
//
//  Created by RAFA on 11/28/24.
//

import UIKit

final class MenuCategoryView: BaseView {

    // MARK: - UI Properties

    private let categoryStackView = UIStackView()
    private let underlineView = UIView()
    private let separatorView = UIView()

    // MARK: - Properties

    private let categories: [MenuCategoryType] = MenuCategoryType.allCases
    private var selectedCategoryIndex: Int = 2

    // MARK: - Actions

    @objc private func topButtonTapped(_ sender: UIButton) {
        guard selectedCategoryIndex != sender.tag else { return }

        selectedCategoryIndex = sender.tag
        updateCategoryStyles()
        updateUnderlinePosition(for: sender)
    }

    // MARK: - UI

    override func setStyle() {
        backgroundColor = .tsWhite
        categoryStackView.setStackView(distribution: .fillProportionally, spacing: 20)
        createCategoryButtons()
        underlineView.backgroundColor = .tsBlack
        separatorView.backgroundColor = .gray20
    }

    override func setHierarchy() {
        addSubviews(
            categoryStackView,
            underlineView,
            separatorView
        )
    }

    override func setLayout() {
        categoryStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(42)
        }

        underlineView.snp.makeConstraints {
            $0.top.equalTo(categoryStackView.snp.bottom)
            $0.height.equalTo(2)
            initializeUnderlinePosition()
        }

        separatorView.snp.makeConstraints {
            $0.top.equalTo(underlineView.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}

// MARK: - Style Helper Methods

private extension MenuCategoryView {

    func configureButton(
        _ button: UIButton,
        for category: MenuCategoryType,
        isSelected: Bool
    ) {
        button.setTitle(category.rawValue, for: .normal)
        button.setTitleColor(isSelected ? .tsBlack : .gray90, for: .normal)
        button.titleLabel?.font = isSelected ? TSFont.t1b : TSFont.t1r
    }

    func createCategoryButtons() {
        categories.enumerated().forEach { index, category in
            let button = UIButton(type: .system)
            button.tag = index
            button.addTarget(self, action: #selector(topButtonTapped), for: .touchUpInside)
            configureButton(button, for: category, isSelected: index == selectedCategoryIndex)
            categoryStackView.addArrangedSubview(button)
        }
    }

    func updateCategoryStyles() {
        categoryStackView.arrangedSubviews.enumerated().forEach { index, view in
            guard let button = view as? UIButton else { return }

            let category = categories[index]

            configureButton(
                button,
                for: category,
                isSelected: index == selectedCategoryIndex
            )
        }
    }

    func updateUnderlinePosition(for button: UIButton) {
        underlineView.snp.remakeConstraints {
            $0.centerX.equalTo(button)
            $0.top.equalTo(categoryStackView.snp.bottom)
            $0.width.equalTo(button.titleLabel?.intrinsicContentSize.width ?? 0)
            $0.height.equalTo(2)
        }
    }

    func initializeUnderlinePosition() {
        guard let button = categoryStackView
            .arrangedSubviews[selectedCategoryIndex] as? UIButton
        else { return }

        updateUnderlinePosition(for: button)
    }
}
