//
//  MyMenuHeaderView.swift
//  TWOSOMEHEART-iOS
//
//  Created by 김예지 on 11/19/24.
//

import UIKit

import SnapKit
import Then

class MyMenuHeaderView: UIView {
    // MARK: - UI Properties
    
    private let totalQuantityLabel = UILabel()
    private let selectAllCheckbox = UIButton(type: .custom)
    private let selectAllLabel = UILabel()
    let deleteButton = UIButton()
    private let separatorLine = UIView()
    
    // MARK: Properties
    private var isAllSelected: Bool = false
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Style, UI, Layout
    
    private func setStyle() {
        totalQuantityLabel.do {
            let fullText = "총 3개"
            let attributedString = NSMutableAttributedString(string: fullText)
            
            let totalText = (fullText as NSString).range(of: "총")
            attributedString.addAttributes([
                .font: TSFont.c2r,
                .foregroundColor: UIColor(resource: .gray90)
            ], range: totalText)
            
            let countText = (fullText as NSString).range(of: "3")
            attributedString.addAttributes([
                .font: TSFont.c2b,
                .foregroundColor: UIColor(resource: .gray90)
            ], range: countText)
            
            let unitText = (fullText as NSString).range(of: "개")
            attributedString.addAttributes([
                .font: TSFont.c2r,
                .foregroundColor: UIColor(resource: .gray90)
            ], range: unitText)
            
            $0.attributedText = attributedString
        }
        
        selectAllCheckbox.do {
            $0.setImage(UIImage(resource: .modalCheckboxDeselect), for: .normal)
            $0.setImage(UIImage(resource: .mymenuCheckboxSelect), for: .selected)
            $0.addTarget(self, action: #selector(selectAllCheckboxTapped), for: .touchUpInside)
        }
        
        selectAllLabel.do {
            $0.text = StringLiterals.MyMenuType.selectAll
            $0.font = TSFont.t1r
            $0.textColor = UIColor(resource: .gray90)
        }
        
        deleteButton.do {
            let text = StringLiterals.MyMenuType.selectDelete
            let attributedString = NSAttributedString(
                string: text,
                attributes: [
                    .font: TSFont.c2r,
                    .foregroundColor: UIColor(resource: .gray90),
                    .underlineStyle: NSUnderlineStyle.single.rawValue
                ]
            )
            $0.setAttributedTitle(attributedString, for: .normal)
        }
        
        separatorLine.do {
            $0.backgroundColor = UIColor(resource: .tsBlack)
        }
    }
    
    private func setHierarchy() {
        addSubviews(totalQuantityLabel,
                    selectAllCheckbox,
                    selectAllLabel,
                    deleteButton,
                    separatorLine)
    }
    
    private func setLayout() {
        totalQuantityLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
        }
        
        selectAllCheckbox.snp.makeConstraints {
            $0.top.equalTo(totalQuantityLabel.snp.bottom).offset(10)
            $0.leading.equalTo(totalQuantityLabel)
            $0.size.equalTo(20)
        }
        
        selectAllLabel.snp.makeConstraints {
            $0.centerY.equalTo(selectAllCheckbox)
            $0.leading.equalTo(selectAllCheckbox.snp.trailing).offset(4)
        }
        
        deleteButton.snp.makeConstraints {
            $0.centerY.equalTo(selectAllLabel)
            $0.trailing.equalToSuperview()
        }
        
        separatorLine.snp.makeConstraints {
            $0.top.equalTo(selectAllLabel.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    // MARK: - Action
    @objc private func selectAllCheckboxTapped() {
        isAllSelected.toggle()
        selectAllCheckbox.isSelected = isAllSelected
    }
}
