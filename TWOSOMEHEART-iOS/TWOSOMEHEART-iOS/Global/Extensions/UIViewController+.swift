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
    
    func makeToast(_ message: String, buttonAction: @escaping () -> Void) {
        let toastView = UIView()
        toastView.do {
            $0.backgroundColor = UIColor(resource: .gray90)
            $0.layer.cornerRadius = 7
        }
        
        let messageLabel = UILabel()
        messageLabel.setLabel(text: message,
                        alignment: .left,
                        textColor: UIColor(resource: .tsWhite),
                        font: TSFont.b1r)
        
        let goToMyMenuButton = UIButton()
        goToMyMenuButton.do {
            $0.backgroundColor = .clear
            $0.setTitle("목록보기", for: .normal)
            $0.setTitleColor(UIColor(resource: .red30), for: .normal)
            $0.titleLabel?.font = TSFont.b1b
            $0.addAction(UIAction { _ in
                buttonAction()
                toastView.removeFromSuperview()
            }, for: .touchUpInside)
        }
        
        view.addSubview(toastView)
        toastView.addSubviews(messageLabel, goToMyMenuButton)
        
        toastView.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.bottom.equalToSuperview().inset(23)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        messageLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(15)
            $0.centerY.equalToSuperview()
        }
        
        goToMyMenuButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(15)
            $0.centerY.equalToSuperview()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            UIView.animate(withDuration: 1.0,
                           delay: 3,
                           options: .curveEaseIn,
                           animations: { toastView.alpha = 0 }) { _ in
                toastView.removeFromSuperview()
            }
        }
    }
    
}
