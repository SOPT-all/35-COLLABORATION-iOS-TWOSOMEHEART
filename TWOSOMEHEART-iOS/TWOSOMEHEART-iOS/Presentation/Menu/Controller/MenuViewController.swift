//
//  MenuViewController.swift
//  TWOSOMEHEART-iOS
//
//  Created by RAFA on 11/28/24.
//

import UIKit

final class MenuViewController: BaseNavViewController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBarStyle()
    }

    // MARK: - UI

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
