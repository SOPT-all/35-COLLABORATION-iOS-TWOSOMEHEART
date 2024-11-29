//
//  BaseTableViewCell.swift
//  TWOSOMEHEART-iOS
//
//  Created by RAFA on 11/20/24.
//

import UIKit

import SnapKit
import Then

class BaseTableViewCell: UITableViewCell {

    // MARK: - Initializer

    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setStyle()
        setHierarchy()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI

    func setStyle() {}

    func setHierarchy() {}

    func setLayout() {}
}
