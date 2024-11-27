//
//  MenuViewController.swift
//  TWOSOMEHEART-iOS
//
//  Created by RAFA on 11/28/24.
//

import UIKit

final class MenuViewController: BaseNavViewController {

    // MARK: - UI Properties

    private let categoryView = MenuCategoryView()
    private let subcategoryView = MenuSubcategoryView()
    private let myButton = MyButton()
    private let selectedStoreView = SelectedStoreView()
    private var tableView = UITableView()

    // MARK: - Properties

    private let menuItems: [Menu] = Menu.sample

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setDelegates()
        registerCells()
        configureNavigationBarStyle()
    }

    // MARK: - Helpers

    private func setDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func registerCells() {
        tableView.register(MenuCell.self, forCellReuseIdentifier: MenuCell.identifier)
    }

    // MARK: - UI

    override func setStyle() {
        view.backgroundColor = .tsWhite
        tableView.separatorStyle = .none
    }

    override func setHierarchy() {
        view.addSubviews(
            categoryView,
            subcategoryView,
            tableView,
            myButton,
            selectedStoreView
        )
    }

    override func setLayout() {
        categoryView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.horizontalEdges.equalToSuperview()
        }

        subcategoryView.snp.makeConstraints {
            $0.top.equalTo(categoryView.snp.bottom).offset(6)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(37)
        }

        tableView.snp.makeConstraints {
            $0.top.equalTo(subcategoryView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(selectedStoreView.snp.top)
        }

        myButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
        }

        selectedStoreView.snp.makeConstraints {
            $0.top.equalTo(myButton.snp.bottom).offset(21)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }

    private func configureNavigationBarStyle() {
        setBackgroundColor(color: .tsWhite)
        setBackButton()
        setHomeButton()
        setTitleLabelStyle(title: "투썸오더", alignment: .center)
        setSearchButton()
        setReceiptButton()
        setBagButton()
    }
}

// MARK: - UITableViewDataSource

extension MenuViewController: UITableViewDataSource {

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return menuItems.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MenuCell.identifier,
            for: indexPath
        ) as? MenuCell else {
            return UITableViewCell()
        }

        let cellData = menuItems[indexPath.row]
        cell.selectionStyle = .none
        cell.configure(cellData)

        return cell
    }
}

// MARK: - UITableViewDelegate

extension MenuViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuDetailVC = MenuDetailViewController()
        navigationController?.pushViewController(menuDetailVC, animated: true)
    }
}
