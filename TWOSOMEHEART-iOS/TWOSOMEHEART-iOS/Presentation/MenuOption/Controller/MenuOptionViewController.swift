//
//  MenuOptionViewController.swift
//  TWOSOMEHEART-iOS
//
//  Created by RAFA on 11/20/24.
//

import UIKit

final class MenuOptionViewController: BaseViewController {

    // MARK: - UI Properties

    private let tableView = UITableView()
    private let bottomView = UIView()
    private let separatorView = UIView()
    private let totalPriceLabel = UILabel()
    private let currencyUnitLabel = UILabel()
    private let totalPriceStackView = UIStackView()
    private let resetButton = UIButton(type: .system)
    private let selectButton = UIButton(type: .system)

    // MARK: - Properties

    private let sections: [MenuOptionSectionType] = MenuOptionSectionType.allCases
    private var headerItems: [MenuOptionHeader] = []
    private let menuOptions = MenuOption.menuOptions
    private var expandedSection: Int?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setDelegates()
        registerCells()
        initializeHeaderItems()
    }

    // MARK: - Helpers

    private func initializeHeaderItems() {
        headerItems = sections.map { sectionType in
            let itemCount: Int
            switch sectionType {
            case .shot: itemCount = 1
            case .syrup: itemCount = 3
            case .whippedCream: itemCount = 1
            case .drizzle: itemCount = 2
            }

            return MenuOptionHeader(
                title: sectionType.rawValue,
                arrowImage: UIImage(resource: .optionArrowDown),
                price: 0,
                itemPrices: Array(repeating: 0, count: itemCount),
                isExpanded: false,
                addedOptions: nil
            )
        }
    }

    private func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func registerCells() {
        tableView.register(
            MenuOptionHeaderView.self,
            forHeaderFooterViewReuseIdentifier: MenuOptionHeaderView.identifier
        )

        tableView.register(
            MenuOptionShotCell.self,
            forCellReuseIdentifier: MenuOptionShotCell.identifier
        )

        tableView.register(
            MenuOptionSyrupCell.self,
            forCellReuseIdentifier: MenuOptionSyrupCell.identifier
        )

        tableView.register(
            MenuOptionWhippedCreamCell.self,
            forCellReuseIdentifier: MenuOptionWhippedCreamCell.identifier
        )

        tableView.register(
            MenuOptionDrizzleCell.self,
            forCellReuseIdentifier: MenuOptionDrizzleCell.identifier
        )
    }

    // MARK: - UI

    override func setStyle() {
        view.backgroundColor = .tsWhite
        bottomView.backgroundColor = .tsWhite
        separatorView.backgroundColor = .tsBlack

        tableView.do {
            $0.separatorStyle = .none
            $0.sectionHeaderTopPadding = 0
            $0.estimatedRowHeight = 161
            $0.sectionHeaderHeight = 86
            $0.estimatedSectionHeaderHeight = 86
            $0.rowHeight = UITableView.automaticDimension
        }

        totalPriceLabel.do {
            $0.setLabel(
                text: "0",
                alignment: .left,
                textColor: .tsBlack,
                font: TSFont.h1b
            )
        }

        currencyUnitLabel.do {
            $0.setLabel(
                text: " 원",
                alignment: .left,
                textColor: .tsBlack,
                font: TSFont.h2r
            )
        }

        totalPriceStackView.do {
            $0.addArrangedSubviews([
                totalPriceLabel,
                currencyUnitLabel
            ])

            $0.setStackView(spacing: 5)
        }

        resetButton.do {
            var config = UIButton.Configuration.plain()
            config.image = .optionReset
            config.imagePlacement = .trailing
            config.imagePadding = 3
            config.contentInsets = .zero
            config.baseForegroundColor = .red40
            $0.configuration = config
            $0.setAttributedTitle(
                NSAttributedString(
                    string: "초기화",
                    attributes: [.font: TSFont.c1r]
                ),
                for: .normal
            )
        }

        selectButton.do {
            $0.backgroundColor = .tsBlack
            $0.setTitle("선택하기", for: .normal)
            $0.setTitleColor(.tsWhite, for: .normal)
            $0.titleLabel?.font = TSFont.btn1s
        }
    }

    override func setHierarchy() {
        bottomView.addSubviews(
            separatorView,
            totalPriceStackView,
            resetButton,
            selectButton
        )

        view.addSubviews(tableView, bottomView)
    }

    override func setLayout() {
        tableView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
        }

        bottomView.snp.makeConstraints {
            $0.top.equalTo(tableView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.height.greaterThanOrEqualTo(135)
        }

        separatorView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(1)
        }

        totalPriceStackView.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).offset(17)
            $0.leading.equalTo(separatorView)
        }

        resetButton.snp.makeConstraints {
            $0.centerY.equalTo(totalPriceStackView)
            $0.leading.greaterThanOrEqualTo(totalPriceStackView.snp.trailing).offset(10)
            $0.trailing.equalTo(separatorView.snp.trailing)
            $0.height.equalTo(44)
        }

        selectButton.snp.makeConstraints {
            $0.top.equalTo(resetButton.snp.bottom).offset(23)
            $0.horizontalEdges.equalToSuperview().inset(15.95)
            $0.bottom.equalTo(bottomView.snp.bottom).inset(15.87)
            $0.height.equalTo(46)
        }
    }
}

// MARK: - UITableViewDataSource

extension MenuOptionViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return headerItems.count
    }

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return expandedSection == section ? 1 : 0
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: identifier(for: indexPath.section),
            for: indexPath
        )

        configureCell(cell, for: indexPath.section)
        addSeparator(to: cell)

        return cell
    }
}

// MARK: - UITableViewDelegate

extension MenuOptionViewController: UITableViewDelegate {

    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: MenuOptionHeaderView.identifier
        ) as? MenuOptionHeaderView else {
            return nil
        }

        let data = headerItems[section]
        headerView.configure(data)
        headerView.configureGesture(delegate: self, section: section)

        return headerView
    }

    func tableView(
        _ tableView: UITableView,
        viewForFooterInSection section: Int
    ) -> UIView? {
        guard section != sections.count - 1 else { return nil }

        let footerView = UIView()
        footerView.backgroundColor = .gray20

        return footerView
    }

    func tableView(
        _ tableView: UITableView,
        heightForFooterInSection section: Int
    ) -> CGFloat {
        return section == sections.count - 1 ? 0 : 1
    }

    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int) -> CGFloat {
        return 86
    }
}

// MARK: - MenuOptionHeaderViewDelegate

extension MenuOptionViewController: MenuOptionHeaderViewDelegate {

    func didTapHeader(section: Int) {
        headerItems.enumerated().forEach { index, _ in
            headerItems[index].isExpanded = (index == section) ?
            !headerItems[index].isExpanded : false
        }

        expandedSection = headerItems[section].isExpanded ? section : nil
        tableView.reloadData()
    }
}

// MARK: - PriceUpdateDelegate

extension MenuOptionViewController: PriceUpdateDelegate {

    func priceDidChange(section: Int, itemIndex: Int, count: Int) {
        guard section < headerItems.count else {
            print("Error: Invalid section index in priceDidChange")
            return
        }

        var header = headerItems[section]

        guard itemIndex < header.itemPrices.count else {
            print("Error: Invalid itemIndex in priceDidChange")
            return
        }

        header.itemPrices[itemIndex] = count * 500
        header.price = header.itemPrices.reduce(0, +)
        header.addedOptions = applyAddedOptionsDescription(
            for: section,
            with: header.itemPrices,
            using: menuOptions
        )

        headerItems[section] = header

        updateTotalPrice()
        updateHeaderView(for: section, with: header)
    }

    private func applyAddedOptionsDescription(
        for section: Int,
        with prices: [Int],
        using menuOptions: [MenuOption]
    ) -> String? {
        guard let menuOption = menuOptions.first(where: { $0.section == section }) else {
            return nil
        }

        return prices.enumerated()
            .filter { $0.element > 0 }
            .map { "\(menuOption.options[$0.offset])x\($0.element / 500)" }
            .joined(separator: ",")
    }

    private func updateTotalPrice() {
        let totalPrice = headerItems.reduce(0) { $0 + $1.price }
        totalPriceLabel.text = "\(totalPrice)"
    }

    private func updateHeaderView(
        for section: Int,
        with header: MenuOptionHeader
    ) {
        guard let headerView = tableView.headerView(
            forSection: section
        ) as? MenuOptionHeaderView else {
            return
        }

        headerView.configure(header)
    }
}

// MARK: - Helper Methods for TableView Configuration

private extension MenuOptionViewController {

    func addSeparator(to cell: UITableViewCell) {
        let separator = UIView()
        separator.backgroundColor = .gray20

        cell.contentView.addSubview(separator)

        separator.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
    }

    func identifier(for section: Int) -> String {
        switch section {
        case 0: return MenuOptionShotCell.identifier
        case 1: return MenuOptionSyrupCell.identifier
        case 2: return MenuOptionWhippedCreamCell.identifier
        case 3: return MenuOptionDrizzleCell.identifier
        default: return ""
        }
    }

    func configureCommonCellStyle(for cell: UITableViewCell) {
        cell.backgroundColor = .gray10
        cell.selectionStyle = .none
    }

    func configureCell(_ cell: UITableViewCell, for section: Int) {
        switch cell {
        case let cell as MenuOptionShotCell:
            cell.priceDelegate = self
            configureCommonCellStyle(for: cell)

        case let cell as MenuOptionSyrupCell:
            cell.priceDelegate = self
            configureCommonCellStyle(for: cell)

        case let cell as MenuOptionWhippedCreamCell:
            cell.priceDelegate = self
            configureCommonCellStyle(for: cell)

        case let cell as MenuOptionDrizzleCell:
            cell.priceDelegate = self
            configureCommonCellStyle(for: cell)

        default:
            break
        }
    }
}
