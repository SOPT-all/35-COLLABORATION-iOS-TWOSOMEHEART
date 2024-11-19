//
//  SegmentType.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/17/24.
//

import UIKit

enum SegmentType {
    
    case temp
    case bean
    case option
    
    var borderColor: UIColor {
        switch self {
        case .temp, .bean:
            return UIColor(resource: .gray30)
        case .option:
            return UIColor(resource: .gray20)
        }
    }
    
    var selectedBackgroundColor: [UIColor] {
        switch self {
        case .temp:
            return [UIColor(resource: .red40), UIColor(resource: .blue10)]
        case .bean:
            return [UIColor(resource: .gray70),
                    UIColor(resource: .tsOrange),
                    UIColor(resource: .blue20)]
        case .option:
            return [UIColor(resource: .gray80), UIColor(resource: .gray80)]
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .temp, .bean:
            return UIColor(resource: .gray60)
        case .option:
            return UIColor(resource: .gray80)
        }
    }

    var selectedTextFont: UIFont {
        switch self {
        case .temp, .bean:
            return TSFont.c1s
        case .option:
            return TSFont.c2s
        }
    }
}
