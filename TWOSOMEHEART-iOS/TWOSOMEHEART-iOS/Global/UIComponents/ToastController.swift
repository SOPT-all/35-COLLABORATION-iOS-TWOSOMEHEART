//
//  ToastView.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/28/24.
//

import UIKit

import SnapKit
import Then

final class ToastController {
    static func show(message: String,
                     buttonTitle: String = "목록보기",
                     buttonAction: @escaping () -> Void) {
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else { return }
        
        let toastView = ToastView(message: message,
                                  buttonTitle: buttonTitle,
                                  buttonAction: buttonAction)
        
        window.addSubview(toastView)
        
        toastView.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.bottom.equalToSuperview().inset(23)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            UIView.animate(withDuration: 1.0) {
                toastView.alpha = 0
            } completion: { _ in
                toastView.removeFromSuperview()
            }
        }
    }
}

final class ToastView: BaseView {
    
    private let messageLabel = UILabel()
    private let actionButton = UIButton()
    
    init(message: String,
         buttonTitle: String,
         buttonAction: @escaping () -> Void) {
        super.init(frame: .zero)
        
        setUI()
        configure(message: message,
              buttonTitle: buttonTitle,
              buttonAction: buttonAction)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        
        addSubviews(messageLabel, actionButton)
        
        messageLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(15)
            $0.centerY.equalToSuperview()
        }
        
        actionButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(15)
            $0.centerY.equalToSuperview()
        }
        
        backgroundColor = UIColor(resource: .gray90)
        layer.cornerRadius = 7
        
        messageLabel.do {
            $0.textAlignment = .left
            $0.textColor = UIColor(resource: .tsWhite)
            $0.font = TSFont.b1r
        }
        
        actionButton.do {
            $0.backgroundColor = .clear
            $0.setTitleColor(UIColor(resource: .red30), for: .normal)
            $0.titleLabel?.font = TSFont.b1b
        }
    }
    
    private func configure(message: String,
                           buttonTitle: String,
                           buttonAction: @escaping () -> Void) {
        messageLabel.text = message
        actionButton.setTitle(buttonTitle, for: .normal)
        actionButton.addAction(UIAction { _ in
            buttonAction()
            self.removeFromSuperview()
        }, for: .touchUpInside)
    }
    
}
