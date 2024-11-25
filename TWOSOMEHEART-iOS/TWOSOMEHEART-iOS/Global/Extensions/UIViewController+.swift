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
        
        if let sheet = self.sheetPresentationController {
            let sheetUtils = SheetUtils()
            sheet.detents = [sheetUtils.customShortDetent, sheetUtils.customLongDetent]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = true
            sheet.prefersGrabberVisible = true
            
            sheet.selectedDetentIdentifier = sheetUtils.customShortDetent.identifier
        }
    }
    
    func setLongSheetLayout() {
        self.modalPresentationStyle = .pageSheet
        
        if let sheet = self.sheetPresentationController {
            let sheetUtils = SheetUtils()
            sheet.detents = [sheetUtils.customShortDetent, sheetUtils.customLongDetent]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = true
            sheet.prefersGrabberVisible = true
            
            sheet.selectedDetentIdentifier = sheetUtils.customLongDetent.identifier
        }
    }
    
}
