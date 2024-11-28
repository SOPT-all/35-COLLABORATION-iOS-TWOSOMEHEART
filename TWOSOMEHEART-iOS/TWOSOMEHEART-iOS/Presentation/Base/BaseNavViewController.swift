//
//  BaseNavViewController.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/17/24.
//

import UIKit

import SnapKit
import Then

class BaseNavViewController: UIViewController {
    
    // MARK: - UI Properties
    
    let topInsetView = UIView()
    
    var navigationBarView = UIView()
    
    var contentView = UIView()
    
    private var leftButton = UIButton()
    
    private var secondLeftButton = UIButton()
    
    private var rightButton = UIButton()
    
    private var secondRightButton = UIButton()
    
    private var thirdRightButton = UIButton()
    
    var titleLabel = UILabel()
    
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setStyle()
    }
    
    func setHierarchy() {
        self.view.addSubviews(topInsetView,
                              navigationBarView,
                              contentView)
        
        self.navigationBarView.addSubviews(leftButton,
                                           secondLeftButton,
                                           rightButton,
                                           secondRightButton,
                                           thirdRightButton,
                                           titleLabel)
    }
    
    func setLayout() {
        topInsetView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        navigationBarView.snp.makeConstraints {
            $0.top.equalTo(topInsetView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(ScreenUtils.height*48/724)
        }
        
        contentView.snp.makeConstraints {
            $0.top.equalTo(navigationBarView.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        
        leftButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(ScreenUtils.width*5/375)
        }
        
        secondLeftButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(ScreenUtils.width*45/375)
        }
        
        rightButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(ScreenUtils.width*6/375)
        }
        
        secondRightButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(ScreenUtils.width*40/375)
        }
        
        thirdRightButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(ScreenUtils.width*76/375)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
    }
    
    func setStyle() {
        self.view.backgroundColor = UIColor(resource: .tsWhite)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        [leftButton,
         secondLeftButton,
         rightButton,
         secondRightButton,
         thirdRightButton,
         titleLabel].forEach { $0.isHidden = true }
    }
    
}


// MARK: - NavigationBar Custom Methods

extension BaseNavViewController {
    
    func setBackgroundColor(color: UIColor) {
        topInsetView.do {
            $0.backgroundColor = color
        }
        navigationBarView.do {
            $0.backgroundColor = color
        }
    }
    
    func setButtonStyle(button: UIButton, image: UIImage?) {
        button.do {
            $0.isHidden = false
            $0.setImage(image, for: .normal)
        }
    }
    
    func setButtonAction(button: UIButton, target: Any, action: Selector) {
        button.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func setTitleLabelStyle(title: String?, alignment: NSTextAlignment) {
        titleLabel.do {
            $0.isHidden = false
            $0.text = title
            $0.font = TSFont.h3b
            $0.textColor = UIColor(resource: .tsBlack)
            $0.textAlignment = alignment
        }
    }
    
}

// MARK: - 많이 사용되는 네비바 버튼 커스텀 메소드

extension BaseNavViewController {
    
    func setBackButton() {
        setButtonStyle(button: leftButton, image: UIImage(resource: .back))
        setButtonAction(button: leftButton, target: self, action: #selector(backButtonTapped))
    }
    
    func setHomeButton() {
        setButtonStyle(button: secondLeftButton, image: UIImage(resource: .home))
    }
    
    func setBagButton() {
        setButtonStyle(button: rightButton, image: UIImage(resource: .bagNumbered))
    }
    
    func setPlusButton() {
        setButtonStyle(button: rightButton, image: UIImage(resource: .mymenuPlus))
    }
    
    func setReceiptButton() {
        setButtonStyle(button: secondRightButton, image: UIImage(resource: .menuReceipt))
    }
    
    func setSearchButton() {
        setButtonStyle(button: thirdRightButton, image: UIImage(resource: .menuSearch))
    }
    
    @objc
    func backButtonTapped() {
        navigationController?.popViewController(animated: false)
    }
    
}
