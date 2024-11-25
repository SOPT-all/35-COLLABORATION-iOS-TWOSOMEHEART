//
//  SheetUtils.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/25/24.
//

import UIKit

struct SheetUtils {
    let shortDetentIdentifier = UISheetPresentationController.Detent.Identifier("customShortDetent")
    let longDetentIdentifier = UISheetPresentationController.Detent.Identifier("customLongDetent")
    
    var customShortDetent: UISheetPresentationController.Detent {
        return UISheetPresentationController.Detent.custom(identifier: shortDetentIdentifier) { _ in
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let safeAreaBottom = windowScene?.windows.first?.safeAreaInsets.bottom ?? 0
            return 526 - safeAreaBottom
        }
    }
    
    var customLongDetent: UISheetPresentationController.Detent {
        return UISheetPresentationController.Detent.custom(identifier: longDetentIdentifier) { _ in
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let safeAreaBottom = windowScene?.windows.first?.safeAreaInsets.bottom ?? 0
            return 592 - safeAreaBottom
        }
    }
}
