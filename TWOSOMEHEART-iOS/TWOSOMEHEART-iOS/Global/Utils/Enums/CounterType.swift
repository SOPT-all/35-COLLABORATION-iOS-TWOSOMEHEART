//
//  CounterType.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/18/24.
//

import UIKit

enum CounterType {
    
    case modal
    case option
    
    var countLabelFont : UIFont {
        switch self {
        case .modal:
            return TSFont.c1s
        case .option:
            return TSFont.c2s
        }
    }
    
    var minusImage : UIImage {
        switch self {
        case .modal:
            return UIImage(resource: .modalMinus)
        case .option:
            return UIImage(resource: .optionMinusAble)
        }
    }
    
    var plusImage : UIImage {
        switch self {
        case .modal:
            return UIImage(resource: .modalPlus)
        case .option:
            return UIImage(resource: .optionMorePlus)
        }
    }

}
