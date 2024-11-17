//
//  SegmentType.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/17/24.
//

import UIKit

enum SegmentType {
    case modal
    case option
    
    var borderColor: UIColor {
        switch self {
        case .modal:
            return UIColor(resource: .gray30)
        case .option:
            return UIColor(resource: .gray20)
        }
    }
    
    var selectedBackgroundColor: UIColor {
        switch self {
        case .modal:
            return UIColor(resource: .gray70)
        case .option:
            return UIColor(resource: .gray80)
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .modal:
            return UIColor(resource: .gray60)
        case .option:
            return UIColor(resource: .gray80)
        }
    }

    var selectedTextFont: UIFont {
        switch self {
        case .modal:
            return TSFont.c1s
        case .option:
            return TSFont.c2s
        }
    }
}
