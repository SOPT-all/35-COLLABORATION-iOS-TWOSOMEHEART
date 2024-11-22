//
//  MenuDetailBottomView.swift
//  TWOSOMEHEART-iOS
//
//  Created by 김예지 on 11/22/24.
//

import UIKit

class MenuDetailBottomView: UIView {
    // MARK: - UI Components
    
    private let allergensTitleLabel = UILabel()
    private let allergensLabel = UILabel()
    lazy var orderButton = UIButton()
    
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
    private func setStyle(){
        
        allergensTitleLabel.do {
            $0.text = "알레르기 유발요인"
            $0.font = TSFont.b1b
            $0.textColor = UIColor(resource: .tsBlack)
        }
        
        allergensLabel.do {
            $0.text = "우유"
            $0.font = TSFont.b2r
            $0.textColor = UIColor(resource: .gray80)
        }
        
        orderButton.do {
            $0.setTitle("주문하기", for: .normal)
            $0.setTitleColor(UIColor(resource: .tsWhite), for: .normal)
            $0.titleLabel?.font = TSFont.btn1s
            $0.backgroundColor = UIColor(resource: .tsBlack)
        }
        
    }
    
    private func setHierarchy(){
        self.addSubviews(allergensTitleLabel,
                    allergensLabel,
                    orderButton
        )
    }
    
    private func setLayout(){
        allergensTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalToSuperview().inset(16)
        }
        
        allergensLabel.snp.makeConstraints {
            $0.top.equalTo(allergensTitleLabel.snp.bottom).offset(13)
            $0.leading.equalTo(allergensTitleLabel.snp.leading)
        }
        
        orderButton.snp.makeConstraints {
            $0.top.equalTo(allergensLabel.snp.bottom).offset(67)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(54)
            $0.bottom.equalToSuperview()
        }
    }
}

