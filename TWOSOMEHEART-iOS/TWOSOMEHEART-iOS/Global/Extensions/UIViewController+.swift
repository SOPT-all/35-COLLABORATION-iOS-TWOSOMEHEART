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
        
        let shortDetentIdentifier = UISheetPresentationController.Detent.Identifier("customShortDetent")
        
        let customShortDetent = UISheetPresentationController.Detent.custom(identifier: shortDetentIdentifier) { _ in
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let safeAreaBottom = windowScene?.windows.first?.safeAreaInsets.bottom ?? 0
            return 526 - safeAreaBottom
        }
        
        let longDetentIdentifier = UISheetPresentationController.Detent.Identifier("customLongDetent")
        
        let customLongDetent = UISheetPresentationController.Detent.custom(identifier: longDetentIdentifier) { _ in
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let safeAreaBottom = windowScene?.windows.first?.safeAreaInsets.bottom ?? 0
            return 592 - safeAreaBottom
        }
        
        if let sheet = self.sheetPresentationController {
            sheet.detents = [customShortDetent, customLongDetent]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = true
            sheet.prefersGrabberVisible = true
            
            sheet.selectedDetentIdentifier = customShortDetent.identifier
        }
    }
    
}
