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
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Style, UI, Layout
    private func setStyle(){
        layer.do {
            $0.shadowColor = UIColor.black.cgColor
            $0.shadowOpacity = 0.15
            $0.shadowOffset = CGSize(width: 0, height: -2)
            $0.shadowRadius = 16
        }
        
        storeLabel.do {
            $0.text = "주문매장"
            $0.font = TSFont.c1r
            $0.textColor = UIColor(resource: .black)
        }
        
        storeNameLabel.do {
            $0.text = "삼성역점"
            $0.font = TSFont.t1b
            $0.textColor = UIColor(resource: .black)
        }
        
        priceTitleLabel.do {
            $0.text = "주문금액"
            $0.font = TSFont.c1r
            $0.textColor = UIColor(resource: .black)
        }
        
        priceLabel.do {
            $0.font = TSFont.t1b
            $0.textColor = UIColor(resource: .black)
        }
        
        quantityLabel.do {
            $0.font = TSFont.c2b
            $0.textColor = UIColor(resource: .black)
        }
        
        orderButton.do {
            $0.setTitle("주문하기", for: .normal)
            $0.setTitleColor(UIColor(resource: .red30), for: .normal)
            $0.titleLabel?.font = TSFont.btn1s
            $0.backgroundColor = UIColor(resource: .black)
        }
    }
    
    private func setUI(){
        addSubviews(
            storeLabel,
            storeNameLabel,
            priceTitleLabel,
            priceLabel,
            quantityLabel,
            orderButton
        )
    }
    
    private func setLayout(){
        storeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(15)
        }
        
        storeNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(storeLabel)
            $0.trailing.equalToSuperview().offset(-15)
        }
        
        priceTitleLabel.snp.makeConstraints {
            $0.top.equalTo(storeLabel.snp.bottom).offset(13)
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
        priceLabel.text = "\(price.formattedPrice())"
        quantityLabel.text = "(\(quantity)EA)"
    }
}
