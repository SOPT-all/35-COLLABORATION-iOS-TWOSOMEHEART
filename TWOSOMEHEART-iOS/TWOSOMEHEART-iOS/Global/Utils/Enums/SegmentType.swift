//
//  SegmentType.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/17/24.
//

import UIKit

enum SegmentType {
    
    case temp
    case size
    case bean
    case pickup
    case option
    
    var borderColor: UIColor {
        switch self {
        case .option:
            return UIColor(resource: .gray20)
        default:
            return UIColor(resource: .gray30)
        }
    }
    
    var selectedBorderColor: [UIColor] {
        switch self {
        case .temp:
            return [UIColor(resource: .red40), UIColor(resource: .blue10)]
        case .bean:
            return [UIColor(resource: .gray70),
                    UIColor(resource: .tsOrange),
                    UIColor(resource: .blue20)]
        case .option:
            return [UIColor(resource: .gray80), UIColor(resource: .gray80)]
        default:
            return [UIColor(resource: .tsBlack), UIColor(resource: .tsBlack)]
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
        default:
            return [UIColor(resource: .tsWhite), UIColor(resource: .tsWhite)]
        }
    }
    
    var textFont: UIFont {
        switch self {
        case .size, .pickup:
            return TSFont.c1r
        default:
            return TSFont.c1s
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .option:
            return UIColor(resource: .gray80)
        default:
            return UIColor(resource: .gray60)
        }
    }
    
    var selectedTextFont: UIFont {
        switch self {
        case .option:
            return TSFont.c2s
        default:
            return TSFont.c1s
        }
    }
    
    var selectedTextColor: UIColor {
        switch self {
        case .size, .pickup:
            return UIColor(resource: .tsBlack)
        default:
            return UIColor(resource: .tsWhite)
        }
    }
    

}
