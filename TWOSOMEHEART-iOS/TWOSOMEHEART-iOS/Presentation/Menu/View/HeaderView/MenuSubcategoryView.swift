//
//  MenuSubcategoryView.swift
//  TWOSOMEHEART-iOS
//
//  Created by RAFA on 11/28/24.
//

import UIKit

final class MenuSubcategoryView: BaseView {

    // MARK: - UI Properties

    private let scrollView = UIScrollView()
    private let subcategoryStackView = UIStackView()

    // MARK: - Properties

    private let subcategories: [MenuSubcategoryType] = MenuSubcategoryType.allCases
    private var selectedSubcategoryIndex: Int = 0

    // MARK: - Actions

    @objc private func subcategoryLabelTapped(_ sender: UITapGestureRecognizer) {
         guard let label = sender.view as? PaddedLabelView else { return }
         guard selectedSubcategoryIndex != label.tag else { return }

         selectedSubcategoryIndex = label.tag
         updateSubcategoryStyles()
     }

    // MARK: - UI

    override func setStyle() {
        backgroundColor = .tsWhite

        scrollView.showsHorizontalScrollIndicator = false
        scrollView.alwaysBounceHorizontal = true

        subcategoryStackView.setStackView(distribution: .fillProportionally, spacing: 11)
        createSubcategoryLabels()
    }

    override func setHierarchy() {
         addSubview(scrollView)
         scrollView.addSubview(subcategoryStackView)
     }

    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        subcategoryStackView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(31)
        }
    }
}

// MARK: - Style Helper Methods

private extension MenuSubcategoryView {

    func configureLabel(
        _ label: PaddedLabelView,
        for subcategory: MenuSubcategoryType,
        isSelected: Bool
    ) {
        label.setPaddedLabel(
            text: subcategory.rawValue,
            alignment: .center,
            textColor: isSelected ? .tsWhite : .gray60,
            font: isSelected ? TSFont.b2s : TSFont.b2r,
            backgroundColor: isSelected ? .tsBlack : .clear
        )

        label.layer.cornerRadius = 15.5
        label.clipsToBounds = true

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(subcategoryLabelTapped))
        label.addGestureRecognizer(tapGesture)
        label.isUserInteractionEnabled = true
    }

    func createSubcategoryLabels() {
        subcategories.enumerated().forEach { index, subcategory in
            let label = PaddedLabelView(padding: UIEdgeInsets(top: 5.5, left: 11, bottom: 5.5, right: 11))
            label.tag = index
            configureLabel(label, for: subcategory, isSelected: index == selectedSubcategoryIndex)
            subcategoryStackView.addArrangedSubview(label)
        }
    }

    func updateSubcategoryStyles() {
        subcategoryStackView.arrangedSubviews.enumerated().forEach { index, view in
            guard let label = view as? PaddedLabelView else { return }

            let subcategory = subcategories[index]

            configureLabel(
                label,
                for: subcategory,
                isSelected: index == selectedSubcategoryIndex
            )
        }
    }
}
