//
//  MenuDetailBottomView.swift
//  TWOSOMEHEART-iOS
//
//  Created by 김예지 on 11/22/24.
//

import UIKit

class MenuDetailBottomView: BaseView {
    // MARK: - UI Components
    private let orderButtonContainerView = UIView()
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
    override func setStyle(){
        orderButtonContainerView.backgroundColor = .tsWhite
        
        orderButton.do {
            $0.setTitle(SLMenuDetail.order, for: .normal)
            $0.setTitleColor(UIColor(resource: .tsWhite), for: .normal)
            $0.titleLabel?.font = TSFont.btn1s
            $0.backgroundColor = UIColor(resource: .tsBlack)
        }
    }
    
    override func setHierarchy() {
        orderButtonContainerView.addSubviews(orderButton)

        addSubview(orderButtonContainerView)
    }
    
    override func setLayout(){
        orderButtonContainerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            
        }
        
        orderButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(54)
            $0.bottom.equalTo(orderButtonContainerView.snp.bottom).inset(30)
        }
    }
}

