//
//  NutritionInfoHeaderView.swift
//  TWOSOMEHEART-iOS
//
//  Created by 김예지 on 11/21/24.
//

import UIKit

import SnapKit
import Then

class NutritionInfoHeaderView: UIView {
    
    // MARK: - UI Components
    private let headerView = UIView()
    private let nutrionInfoLabel = UILabel()
    lazy var detailArrowButton = UIButton()
    private let seperateLine = UIView()
    private let nutritionInfoView = NutritionInfoView()
    
    // MARK: - Properties
    private var isExpanded = false
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Style, UI, Layout
    
    private func setStyle(){
        headerView.do {
            $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(detailArrowButtonTapped)))
        }
        
        nutrionInfoLabel.do {
            $0.setLabel(
                text: "제품 영양 정보",
                alignment: .left,
                textColor: .tsBlack,
                font: TSFont.t1b
            )
        }
        
        detailArrowButton.do {
            $0.setImage(UIImage(resource: .detailArrowDown), for: .normal)
            $0.setImage(UIImage(resource: .detailArrowUp), for: .selected)
            $0.isUserInteractionEnabled = false
        }
        
        seperateLine.do {
            $0.backgroundColor = UIColor(resource: .gray10)
        }
        
        nutritionInfoView.do {
            $0.isHidden = true
        }
    }
    
    private func setUI() {
        headerView.addSubviews(nutrionInfoLabel, detailArrowButton)
        self.addSubviews(headerView, seperateLine, nutritionInfoView)
    }
    
    private func setLayout() {
        headerView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(68)
        }
        
        nutrionInfoLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
        }
        
        detailArrowButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(24)
        }
        
        seperateLine.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        nutritionInfoView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Action
    @objc private func detailArrowButtonTapped() {
        isExpanded.toggle()
        detailArrowButton.isSelected = isExpanded
        
        UIView.animate(withDuration: 0.3) {
            self.seperateLine.isHidden = !self.isExpanded
            self.nutritionInfoView.isHidden = !self.isExpanded
            self.layoutIfNeeded()
        }
    }
}
