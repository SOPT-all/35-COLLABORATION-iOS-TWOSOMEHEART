//
//  MyMenuModalView.swift
//  TWOSOMEHEART-iOS
//
//  Created by 김예지 on 11/18/24.
//

import UIKit

import SnapKit
import Then

class MyMenuModalView: UIView {
    // MARK: - UI Components
    private let containerView = UIView()
    private let storeLabel = UILabel()
    private let storeNameLabel = UILabel()
    private let priceTitleLabel = UILabel()
    private let priceLabel = UILabel()
    private let quantityLabel = UILabel()
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
        containerView.do {
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 16
            $0.layer.shadowColor = UIColor(resource: .tsBlack).cgColor
            $0.layer.shadowOpacity = 0.15
            $0.layer.shadowOffset = CGSize(width: 0, height: 0)
            $0.layer.shadowRadius = 8
            $0.layer.masksToBounds = false
        }
        
        storeLabel.do {
            $0.text = StringLiterals.MyMenuType.orderStore
            $0.font = TSFont.c1r
            $0.textColor = UIColor(resource: .tsBlack)
        }
        
        storeNameLabel.do {
            $0.text = StringLiterals.MyMenuType.storeName
            $0.font = TSFont.t1b
            $0.textColor = UIColor(resource: .tsBlack)
        }
        
        priceTitleLabel.do {
            $0.text = StringLiterals.MyMenuType.orderPrice
            $0.font = TSFont.c1r
            $0.textColor = UIColor(resource: .tsBlack)
        }
        
        priceLabel.do {
            $0.font = TSFont.t1b
            $0.textColor = UIColor(resource: .tsBlack)
        }
        
        quantityLabel.do {
            $0.font = TSFont.c2b
            $0.textColor = UIColor(resource: .tsBlack)
        }
        
        orderButton.do {
            $0.setTitle(StringLiterals.MyMenuType.goOrder, for: .normal)
            $0.setTitleColor(UIColor(resource: .red30), for: .normal)
            $0.titleLabel?.font = TSFont.btn1s
            $0.backgroundColor = UIColor(resource: .tsBlack)
        }
    }
    
    private func setHierarchy(){
        addSubview(containerView)
        containerView.addSubviews(
            storeLabel,
            storeNameLabel,
            priceTitleLabel,
            priceLabel,
            quantityLabel,
            orderButton
        )
    }
    
    private func setLayout(){
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        storeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(15)
        }
        
        storeNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(storeLabel)
            $0.trailing.equalToSuperview().offset(-15)
        }
        
        priceTitleLabel.snp.makeConstraints {
            $0.top.equalTo(storeLabel.snp.bottom).offset(5)
            $0.leading.equalTo(storeLabel)
        }
        
        priceLabel.snp.makeConstraints {
            $0.centerY.equalTo(priceTitleLabel)
            $0.trailing.equalTo(quantityLabel.snp.leading).offset(-4)
        }
        
        quantityLabel.snp.makeConstraints {
            $0.centerY.equalTo(priceLabel)
            $0.trailing.equalTo(storeNameLabel.snp.trailing)
        }
        
        orderButton.snp.makeConstraints {
            $0.top.equalTo(priceTitleLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(46)
            $0.bottom.equalToSuperview().offset(-30)
        }
    }
}

extension MyMenuModalView {
    func configure(price: Int, quantity: Int) {
        priceLabel.text = "\(price.formattedPrice())원"
        quantityLabel.text = "(\(quantity)EA)"
    }
}
