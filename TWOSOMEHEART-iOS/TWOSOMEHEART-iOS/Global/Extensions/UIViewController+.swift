//
//  UIViewController+.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/20/24.
//

import UIKit

extension UIViewController {
    
    func setSheetLayout() {
        self.modalPresentationStyle = .pageSheet
        
        let detentIdentifier = UISheetPresentationController.Detent.Identifier("customDetent")
        
        let customShortDetent = UISheetPresentationController.Detent.custom(identifier: detentIdentifier) { _ in
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let safeAreaBottom = windowScene?.windows.first?.safeAreaInsets.bottom ?? 0
            return 526 - safeAreaBottom
        }
        
        let customLongDetent = UISheetPresentationController.Detent.custom(identifier: detentIdentifier) { _ in
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let safeAreaBottom = windowScene?.windows.first?.safeAreaInsets.bottom ?? 0
            return 592 - safeAreaBottom
        }
        
        if let sheet = self.sheetPresentationController {
            sheet.detents = [customShortDetent, customLongDetent]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = true
            sheet.prefersGrabberVisible = true
        }
    }
    
}
