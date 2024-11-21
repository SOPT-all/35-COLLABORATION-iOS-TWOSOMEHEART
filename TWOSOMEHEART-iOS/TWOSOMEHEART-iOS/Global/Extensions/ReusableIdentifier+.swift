//
//  ReusableIdentifier+.swift
//  TWOSOMEHEART-iOS
//
//  Created by RAFA on 11/20/24.
//

import UIKit

protocol ReusableIdentifier: AnyObject {}

extension ReusableIdentifier where Self: UIView {

    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionReusableView: ReusableIdentifier {}

extension UITableViewCell: ReusableIdentifier {}

extension UITableViewHeaderFooterView: ReusableIdentifier {}
